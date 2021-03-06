package com.leanvienna.studentlife.domain;

import com.leanvienna.studentlife.domain.Course;
import java.lang.Integer;
import java.lang.Long;
import java.lang.SuppressWarnings;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Course_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Course.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long Course.id;
    
    @Version
    @Column(name = "version")
    private Integer Course.version;
    
    public Long Course.getId() {
        return this.id;
    }
    
    public void Course.setId(Long id) {
        this.id = id;
    }
    
    public Integer Course.getVersion() {
        return this.version;
    }
    
    public void Course.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Course.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Course.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Course attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Course.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public Course Course.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Course merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Course.entityManager() {
        EntityManager em = new Course().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Course.countCourses() {
        return ((Number) entityManager().createQuery("select count(o) from Course o").getSingleResult()).longValue();
    }
    
    @SuppressWarnings("unchecked")
    public static List<Course> Course.findAllCourses() {
        return entityManager().createQuery("select o from Course o").getResultList();
    }
    
    public static Course Course.findCourse(Long id) {
        if (id == null) return null;
        return entityManager().find(Course.class, id);
    }
    
    @SuppressWarnings("unchecked")
    public static List<Course> Course.findCourseEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from Course o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
