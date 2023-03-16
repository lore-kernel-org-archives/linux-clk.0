Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03A8C6FD1F
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 12:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjCPMUS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 08:20:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbjCPMUJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 08:20:09 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57C36F482
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 05:20:06 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id w11so55866wmo.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 05:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1678969205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KVg+HQThYLeKdF+SktSMsvte8PrLc9Lz2m3zKerLoNk=;
        b=ZhDFoWhwconSBXik8/oCRlArTiRy527X7RdRqxrwfyQ5fkRSreWP1etpng7OxaUueW
         SQrrinv9bCUZ+D5Ff5mwash2BmAtm7oAbgK3O8Bi3wPZRCm+Ut0xivl5eDiQcYa/ep57
         a2xNYuT63EgoPoBPAkYf0y+NiFkP/iWwTrhkEmSl4r4t8f5yjureSha3DO9N+EE5JKDl
         4MeCwSpOncYclsC10Kh0fUKE0IiJpKOwRXRNNIlo171Ulk48OikvIORtVoTqRI3lYvVB
         eNuBi2133KWkLMzVqhzdXpwAVlpUopg2WEhHc/ToyZ9fFEAaAv6uSHbudyWScqvFXI5S
         4MQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678969205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVg+HQThYLeKdF+SktSMsvte8PrLc9Lz2m3zKerLoNk=;
        b=QDmjbR5WhbQK+q8mlfjWHqg2BgsV6oZF71SDJxUWx1fnWYE9z7lI2WwUefB9XqQ8gw
         Zg7pR0gVE0JIj5VkuLLzc0LQz4tQb2I6bUR49jq3NYZbdRvMfw3cJbytQ5GmwmIOWGjf
         La21jVG7qY82iAVgczUlqSxpyeX8bAzabV0c0+ry534nJE5fwo7OyYnT0gP/Ih64AXSd
         8Ui4/C4HI2VpLcNP6tJfnzXfsvzSRriSRfwUTy3N+Nh8zJDz4XRM5Y0cHDqZ5ILtz5EH
         hSxC6TYzoIRWfmtTatyCDf5NIrEyDUmM4SD9TDcEwPJaC4Xz5DdCoiBSHFndZ/j2pujv
         /7sA==
X-Gm-Message-State: AO0yUKU5bsvBMLxonea3trm0zqfDcUgTXWBUryN/IsrQobkBIImUni+q
        p8IuPR0MRVMko5PiVN4/gWyStg==
X-Google-Smtp-Source: AK7set+HaibucjTBWivbHwnXhA0iqdbe7hqauTwSwnA8PmD5OKUxEllEvl5Qz0afAowWtVk8fpYIdg==
X-Received: by 2002:a05:600c:4707:b0:3eb:29fe:f912 with SMTP id v7-20020a05600c470700b003eb29fef912mr20771676wmo.36.1678969204980;
        Thu, 16 Mar 2023 05:20:04 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id z1-20020adff1c1000000b002cea8e3bd54sm7137333wro.53.2023.03.16.05.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 05:20:04 -0700 (PDT)
Date:   Thu, 16 Mar 2023 13:20:03 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZBMJc9abj/DP4RiN@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-3-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312022807.278528-3-vadfed@meta.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Sun, Mar 12, 2023 at 03:28:03AM CET, vadfed@meta.com wrote:

[...]


>+/**
>+ * dpll_pin_unregister - deregister dpll pin from dpll device
>+ * @dpll: registered dpll pointer
>+ * @pin: pointer to a pin
>+ *
>+ * Note: It does not free the memory
>+ */
>+int dpll_pin_unregister(struct dpll_device *dpll, struct dpll_pin *pin)

Make this return void. Function does not report anything useful,
non-0 is only in case of WARN_ON. Nobody is going to check that ever
anyway.


>+{
>+	if (WARN_ON(xa_empty(&dpll->pin_refs)))
>+		return -ENOENT;
>+
>+	mutex_lock(&dpll_device_xa_lock);
>+	mutex_lock(&dpll_pin_xa_lock);
>+	__dpll_pin_unregister(dpll, pin);
>+	mutex_unlock(&dpll_pin_xa_lock);
>+	mutex_unlock(&dpll_device_xa_lock);
>+
>+	return 0;
>+}
>+EXPORT_SYMBOL_GPL(dpll_pin_unregister);

[...]

