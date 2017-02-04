package com.upingwang.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SystemBureauExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SystemBureauExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andBureauNameIsNull() {
            addCriterion("bureau_name is null");
            return (Criteria) this;
        }

        public Criteria andBureauNameIsNotNull() {
            addCriterion("bureau_name is not null");
            return (Criteria) this;
        }

        public Criteria andBureauNameEqualTo(String value) {
            addCriterion("bureau_name =", value, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameNotEqualTo(String value) {
            addCriterion("bureau_name <>", value, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameGreaterThan(String value) {
            addCriterion("bureau_name >", value, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameGreaterThanOrEqualTo(String value) {
            addCriterion("bureau_name >=", value, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameLessThan(String value) {
            addCriterion("bureau_name <", value, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameLessThanOrEqualTo(String value) {
            addCriterion("bureau_name <=", value, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameLike(String value) {
            addCriterion("bureau_name like", value, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameNotLike(String value) {
            addCriterion("bureau_name not like", value, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameIn(List<String> values) {
            addCriterion("bureau_name in", values, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameNotIn(List<String> values) {
            addCriterion("bureau_name not in", values, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameBetween(String value1, String value2) {
            addCriterion("bureau_name between", value1, value2, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauNameNotBetween(String value1, String value2) {
            addCriterion("bureau_name not between", value1, value2, "bureauName");
            return (Criteria) this;
        }

        public Criteria andBureauAreaIsNull() {
            addCriterion("bureau_area is null");
            return (Criteria) this;
        }

        public Criteria andBureauAreaIsNotNull() {
            addCriterion("bureau_area is not null");
            return (Criteria) this;
        }

        public Criteria andBureauAreaEqualTo(String value) {
            addCriterion("bureau_area =", value, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaNotEqualTo(String value) {
            addCriterion("bureau_area <>", value, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaGreaterThan(String value) {
            addCriterion("bureau_area >", value, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaGreaterThanOrEqualTo(String value) {
            addCriterion("bureau_area >=", value, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaLessThan(String value) {
            addCriterion("bureau_area <", value, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaLessThanOrEqualTo(String value) {
            addCriterion("bureau_area <=", value, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaLike(String value) {
            addCriterion("bureau_area like", value, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaNotLike(String value) {
            addCriterion("bureau_area not like", value, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaIn(List<String> values) {
            addCriterion("bureau_area in", values, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaNotIn(List<String> values) {
            addCriterion("bureau_area not in", values, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaBetween(String value1, String value2) {
            addCriterion("bureau_area between", value1, value2, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauAreaNotBetween(String value1, String value2) {
            addCriterion("bureau_area not between", value1, value2, "bureauArea");
            return (Criteria) this;
        }

        public Criteria andBureauCodeIsNull() {
            addCriterion("bureau_code is null");
            return (Criteria) this;
        }

        public Criteria andBureauCodeIsNotNull() {
            addCriterion("bureau_code is not null");
            return (Criteria) this;
        }

        public Criteria andBureauCodeEqualTo(String value) {
            addCriterion("bureau_code =", value, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeNotEqualTo(String value) {
            addCriterion("bureau_code <>", value, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeGreaterThan(String value) {
            addCriterion("bureau_code >", value, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeGreaterThanOrEqualTo(String value) {
            addCriterion("bureau_code >=", value, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeLessThan(String value) {
            addCriterion("bureau_code <", value, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeLessThanOrEqualTo(String value) {
            addCriterion("bureau_code <=", value, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeLike(String value) {
            addCriterion("bureau_code like", value, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeNotLike(String value) {
            addCriterion("bureau_code not like", value, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeIn(List<String> values) {
            addCriterion("bureau_code in", values, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeNotIn(List<String> values) {
            addCriterion("bureau_code not in", values, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeBetween(String value1, String value2) {
            addCriterion("bureau_code between", value1, value2, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andBureauCodeNotBetween(String value1, String value2) {
            addCriterion("bureau_code not between", value1, value2, "bureauCode");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andDelflagIsNull() {
            addCriterion("delflag is null");
            return (Criteria) this;
        }

        public Criteria andDelflagIsNotNull() {
            addCriterion("delflag is not null");
            return (Criteria) this;
        }

        public Criteria andDelflagEqualTo(Integer value) {
            addCriterion("delflag =", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagNotEqualTo(Integer value) {
            addCriterion("delflag <>", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagGreaterThan(Integer value) {
            addCriterion("delflag >", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagGreaterThanOrEqualTo(Integer value) {
            addCriterion("delflag >=", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagLessThan(Integer value) {
            addCriterion("delflag <", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagLessThanOrEqualTo(Integer value) {
            addCriterion("delflag <=", value, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagIn(List<Integer> values) {
            addCriterion("delflag in", values, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagNotIn(List<Integer> values) {
            addCriterion("delflag not in", values, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagBetween(Integer value1, Integer value2) {
            addCriterion("delflag between", value1, value2, "delflag");
            return (Criteria) this;
        }

        public Criteria andDelflagNotBetween(Integer value1, Integer value2) {
            addCriterion("delflag not between", value1, value2, "delflag");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNull() {
            addCriterion("create_user is null");
            return (Criteria) this;
        }

        public Criteria andCreateUserIsNotNull() {
            addCriterion("create_user is not null");
            return (Criteria) this;
        }

        public Criteria andCreateUserEqualTo(String value) {
            addCriterion("create_user =", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotEqualTo(String value) {
            addCriterion("create_user <>", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThan(String value) {
            addCriterion("create_user >", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserGreaterThanOrEqualTo(String value) {
            addCriterion("create_user >=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThan(String value) {
            addCriterion("create_user <", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLessThanOrEqualTo(String value) {
            addCriterion("create_user <=", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserLike(String value) {
            addCriterion("create_user like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotLike(String value) {
            addCriterion("create_user not like", value, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserIn(List<String> values) {
            addCriterion("create_user in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotIn(List<String> values) {
            addCriterion("create_user not in", values, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserBetween(String value1, String value2) {
            addCriterion("create_user between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateUserNotBetween(String value1, String value2) {
            addCriterion("create_user not between", value1, value2, "createUser");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}