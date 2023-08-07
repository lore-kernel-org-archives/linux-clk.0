Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 332F2C001B0
	for <linux-clk@archiver.kernel.org>; Mon,  7 Aug 2023 08:11:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjHGILU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Aug 2023 04:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjHGILT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 04:11:19 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74449170A
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 01:11:17 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe5eb84d8bso2185405e9.2
        for <linux-clk@vger.kernel.org>; Mon, 07 Aug 2023 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691395876; x=1692000676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N0qYRLhjDJL7Pu5pLEH8TGtQxZMDB4c7QmZ9lm0OIUQ=;
        b=cEfe6XvkFp1M44Cikps2bjZz5YJnd9TXncqXN56J61bLMbPNtW1M4PqgKz/XNgjH7y
         6+jnO0qJt85mEySNEmuv6mpz34HcJTiDpnAzUJ/g+nToy60LFMfBtvR1JZHdbJmukTen
         5Iv8GaIYakqS7GZ5yzC1+HI839t+Q0mLcelAa0AJ9kGZ8aM2OFZbv1YMil4kK21voiik
         kPRJ8ulVb64E2PsjCvSguHBkTJl+XzAaOMiWA0QzGBGdUVvwc3YnBQzMxjSeomWjFzZl
         jmHTp2F3bdwzQEPGEp8YUX7DOQSzSewI/IjkCd1nE8I2n0QU8gPJx+M10/eX0TGvY3vq
         bJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691395876; x=1692000676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0qYRLhjDJL7Pu5pLEH8TGtQxZMDB4c7QmZ9lm0OIUQ=;
        b=VYVGHiyE/j1lGfPdYdBCPuQvSh0V6TjKyRrU/JsqOBU/Pf13suS5a1MsFYQWJvkg9h
         pafAjG3a2mrVMI7IXzF2y1dcLjJKyZhNYioDs6c+e3+HcdD7R9ydygaowRlt+MsKMv0T
         jdghqzKbZEpL7aSpseam5yDX5mJgmxkzsdd6UcnQECh8fxACYPZsP22akMGrWThBhNqY
         lM/R7AYbJw6HbVLBLpGDCHL4NZzn/YOMOP426reHdd+OS0X/EFxuS+cOpWMC+dK7qJyp
         tzzAH1vNy5oYi5tJMJC5MJgEBZkianZbA6UkohVhj2W12kFOJphDGv87KgC6YZi4Wdt+
         1QMQ==
X-Gm-Message-State: AOJu0YwDfyxrHCfSAGHJgzGRZSll3DwwQ8gA3qhrjzVDbPRBUPQzfwoQ
        5ypee26+FWRXL2HU4b+PXuK9Ec3JN8nmRpaNZcSC1A==
X-Google-Smtp-Source: AGHT+IEEdHTr4GqkRd3deEQMZXM1fJczL0sbYRdmLfTsQ9mLjt9yFpcg6J6A5IYmi2REfTncCjo2WA==
X-Received: by 2002:a05:600c:208:b0:3fe:1f80:7d92 with SMTP id 8-20020a05600c020800b003fe1f807d92mr5507969wmi.8.1691395875864;
        Mon, 07 Aug 2023 01:11:15 -0700 (PDT)
Received: from localhost ([212.23.236.67])
        by smtp.gmail.com with ESMTPSA id l24-20020a7bc458000000b003fe20db88ebsm9914745wmi.31.2023.08.07.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 01:11:15 -0700 (PDT)
Date:   Mon, 7 Aug 2023 10:11:14 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v2 4/9] dpll: netlink: Add DPLL framework base
 functions
Message-ID: <ZNCnInbK2O0HZGkH@nanopsycho>
References: <20230804190454.394062-1-vadim.fedorenko@linux.dev>
 <20230804190454.394062-5-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804190454.394062-5-vadim.fedorenko@linux.dev>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Aug 04, 2023 at 09:04:49PM CEST, vadim.fedorenko@linux.dev wrote:
>DPLL framework is used to represent and configure DPLL devices
>in systems. Each device that has DPLL and can configure inputs
>and outputs can use this framework.
>
>Implement dpll netlink framework functions for enablement of dpll
>subsystem netlink family.
>
>Co-developed-by: Milena Olech <milena.olech@intel.com>
>Signed-off-by: Milena Olech <milena.olech@intel.com>
>Co-developed-by: Michal Michalik <michal.michalik@intel.com>
>Signed-off-by: Michal Michalik <michal.michalik@intel.com>
>Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>Co-developed-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Besides couple of small nits below, looks fine to me.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>

[...]

>+static int
>+dpll_pin_freq_set(struct dpll_pin *pin, struct nlattr *a,
>+		  struct netlink_ext_ack *extack)
>+{
>+	u64 freq = nla_get_u64(a);
>+	struct dpll_pin_ref *ref;
>+	unsigned long i;
>+	int ret;
>+
>+	if (!dpll_pin_is_freq_supported(pin, freq)) {
>+		NL_SET_ERR_MSG_FMT(extack, "not supported freq:%llu on pin:%u",

Please remove "pin%u". User knows on which object he is operating.


>+				   freq, pin->id);
>+		return -EINVAL;
>+	}
>+
>+	xa_for_each(&pin->dpll_refs, i, ref) {
>+		const struct dpll_pin_ops *ops = dpll_pin_ops(ref);
>+		struct dpll_device *dpll = ref->dpll;
>+
>+		if (!ops->frequency_set)
>+			return -EOPNOTSUPP;
>+		ret = ops->frequency_set(pin, dpll_pin_on_dpll_priv(dpll, pin),
>+					 dpll, dpll_priv(dpll), freq, extack);
>+		if (ret)
>+			return ret;
>+		__dpll_pin_change_ntf(pin);
>+	}
>+
>+	return 0;
>+}
>+
>+static int
>+dpll_pin_on_pin_state_set(struct dpll_pin *pin, u32 parent_idx,
>+			  enum dpll_pin_state state,
>+			  struct netlink_ext_ack *extack)
>+{
>+	struct dpll_pin_ref *parent_ref;
>+	const struct dpll_pin_ops *ops;
>+	struct dpll_pin_ref *dpll_ref;
>+	void *pin_priv, *parent_priv;
>+	struct dpll_pin *parent;
>+	unsigned long i;
>+	int ret;
>+
>+	if (!(DPLL_PIN_CAPS_STATE_CAN_CHANGE & pin->prop->capabilities)) {
>+		NL_SET_ERR_MSG_FMT(extack, "pin:%u not allowed to change state",

Please remove "pin%u". User knows on which object he is operating.


>+				   pin->id);
>+		return -EOPNOTSUPP;
>+	}
>+	parent = xa_load(&dpll_pin_xa, parent_idx);
>+	if (!parent)
>+		return -EINVAL;
>+	parent_ref = xa_load(&pin->parent_refs, parent->pin_idx);
>+	if (!parent_ref)
>+		return -EINVAL;
>+	xa_for_each(&parent->dpll_refs, i, dpll_ref) {
>+		ops = dpll_pin_ops(parent_ref);
>+		if (!ops->state_on_pin_set)
>+			return -EOPNOTSUPP;
>+		pin_priv = dpll_pin_on_pin_priv(parent, pin);
>+		parent_priv = dpll_pin_on_dpll_priv(dpll_ref->dpll, parent);
>+		ret = ops->state_on_pin_set(pin, pin_priv, parent, parent_priv,
>+					    state, extack);
>+		if (ret)
>+			return ret;
>+	}
>+	__dpll_pin_change_ntf(pin);
>+
>+	return 0;
>+}
>+
>+static int
>+dpll_pin_state_set(struct dpll_device *dpll, struct dpll_pin *pin,
>+		   enum dpll_pin_state state,
>+		   struct netlink_ext_ack *extack)
>+{
>+	const struct dpll_pin_ops *ops;
>+	struct dpll_pin_ref *ref;
>+	int ret;
>+
>+	if (!(DPLL_PIN_CAPS_STATE_CAN_CHANGE & pin->prop->capabilities)) {
>+		NL_SET_ERR_MSG_FMT(extack, "pin:%u not allowed to change state",

Please remove "pin%u". User knows on which object he is operating.


>+				   pin->id);
>+		return -EOPNOTSUPP;
>+	}
>+	ref = xa_load(&pin->dpll_refs, dpll->device_idx);
>+	ASSERT_NOT_NULL(ref);
>+	ops = dpll_pin_ops(ref);
>+	if (!ops->state_on_dpll_set)
>+		return -EOPNOTSUPP;
>+	ret = ops->state_on_dpll_set(pin, dpll_pin_on_dpll_priv(dpll, pin),
>+				     dpll, dpll_priv(dpll), state, extack);
>+	if (ret)
>+		return ret;
>+	__dpll_pin_change_ntf(pin);
>+
>+	return 0;
>+}
>+
>+static int
>+dpll_pin_prio_set(struct dpll_device *dpll, struct dpll_pin *pin,
>+		  u32 prio, struct netlink_ext_ack *extack)
>+{
>+	const struct dpll_pin_ops *ops;
>+	struct dpll_pin_ref *ref;
>+	int ret;
>+
>+	if (!(DPLL_PIN_CAPS_PRIORITY_CAN_CHANGE & pin->prop->capabilities)) {
>+		NL_SET_ERR_MSG_FMT(extack, "pin:%u not allowed to change prio",

Please remove "pin%u". User knows on which object he is operating.


>+				   pin->id);
>+		return -EOPNOTSUPP;
>+	}
>+	ref = xa_load(&pin->dpll_refs, dpll->device_idx);
>+	ASSERT_NOT_NULL(ref);
>+	ops = dpll_pin_ops(ref);
>+	if (!ops->prio_set)
>+		return -EOPNOTSUPP;
>+	ret = ops->prio_set(pin, dpll_pin_on_dpll_priv(dpll, pin), dpll,
>+			    dpll_priv(dpll), prio, extack);
>+	if (ret)
>+		return ret;
>+	__dpll_pin_change_ntf(pin);
>+
>+	return 0;
>+}
>+
>+static int
>+dpll_pin_direction_set(struct dpll_pin *pin, struct dpll_device *dpll,
>+		       enum dpll_pin_direction direction,
>+		       struct netlink_ext_ack *extack)
>+{
>+	const struct dpll_pin_ops *ops;
>+	struct dpll_pin_ref *ref;
>+	int ret;
>+
>+	if (!(DPLL_PIN_CAPS_DIRECTION_CAN_CHANGE & pin->prop->capabilities)) {
>+		NL_SET_ERR_MSG_FMT(extack,
>+				   "pin:%u not allowed to change direction",

Please remove "pin%u". User knows on which object he is operating.


>+				   pin->id);
>+		return -EOPNOTSUPP;
>+	}
>+	ref = xa_load(&pin->dpll_refs, dpll->device_idx);
>+	ASSERT_NOT_NULL(ref);
>+	ops = dpll_pin_ops(ref);
>+	if (!ops->direction_set)
>+		return -EOPNOTSUPP;
>+	ret = ops->direction_set(pin, dpll_pin_on_dpll_priv(dpll, pin),
>+				 dpll, dpll_priv(dpll), direction, extack);
>+	if (ret)
>+		return ret;
>+	__dpll_pin_change_ntf(pin);
>+
>+	return 0;
>+}
>+

[...]


>+static int
>+dpll_pin_set_from_nlattr(struct dpll_pin *pin, struct genl_info *info)
>+{
>+	int rem, ret = -EINVAL;
>+	struct nlattr *a;
>+
>+	nla_for_each_attr(a, genlmsg_data(info->genlhdr),
>+			  genlmsg_len(info->genlhdr), rem) {
>+		switch (nla_type(a)) {
>+		case DPLL_A_PIN_FREQUENCY:
>+			ret = dpll_pin_freq_set(pin, a, info->extack);
>+			if (ret)
>+				return ret;
>+			break;
>+		case DPLL_A_PIN_PARENT_DEVICE:
>+			ret = dpll_pin_parent_device_set(pin, a, info->extack);
>+			if (ret)
>+				return ret;
>+			break;
>+		case DPLL_A_PIN_PARENT_PIN:
>+			ret = dpll_pin_parent_pin_set(pin, a, info->extack);
>+			if (ret)
>+				return ret;
>+			break;
>+		case DPLL_A_PIN_ID:
>+		case DPLL_A_ID:
>+			break;
>+		default:
>+			NL_SET_ERR_MSG_FMT(info->extack,
>+					   "unsupported attribute (%d)",
>+					   nla_type(a));

How exactly this could happen? I mean, we have strict parsing on, the
policy checking during parse ensures no unknown attr is seen here.
Please remove this "default" section.


>+			return -EINVAL;
>+		}
>+	}
>+
>+	return 0;
>+}
>+

[...]
