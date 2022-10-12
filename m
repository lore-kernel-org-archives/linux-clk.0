Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63925C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 12 Oct 2022 15:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbiJLPPN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Oct 2022 11:15:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiJLPO5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2022 11:14:57 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F02DFAE
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 08:14:50 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id z97so24905702ede.8
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJ++cbZT1GQzcKkN54BOhV7muiCQDnF4CoMQA5s9ysQ=;
        b=S1UtZnd2tdB+a5PXbVodnKXWsutQqYUr5VBM58AjcjhbjfTgtIhmVALjjqCw1fqRc1
         vE81XHq3/VTvpp1kr+K/JeJjHETVGzX7sK+Ht8+713sxQljFksxFxFKq7vJw6ROZ4uls
         hfAlMmOJjcLCSWcBnH33LssWpjWaP0nyLj5ISq9Gwih8CxR8K2z2Wn0MlofDxBKTYHok
         +zhzoOoF0bpQqPKPmD7sbkvUvH5Nvq31BTHapAIq39ViPOd//EjxYDH90n+yiKIg8n1O
         qZz8GPCcCrI66Ca8cjezsgpsyAIbu0TCNCn0hpZAeIo8guIlJZqPeD0YNL94kcN8BIcj
         BkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ++cbZT1GQzcKkN54BOhV7muiCQDnF4CoMQA5s9ysQ=;
        b=4CZgWE+XioDayqaQ6cTf2d78bvNJ6DrjjCK5M2+YsR6V0m1NRN/4c88kL8+fWoUI57
         lZubnP5OMFVBRDc1Jfsckv8Q8kOLrMZDv5KCMijxnUhaNvybPaSshNOwIr+BtSeGe0H3
         HqKnOsPEPxOLb19yieTPXba24cAsBZKeF9U2kJUpU+sfTRi9I6T2D3CqowhYS4Dn1Ag1
         EIf6kppaOtobOP6r6bc6AU7Aw8mfqtQTkZXTkeY8ogIla+kPnCZ+veR8R1ucvcx+4Muv
         EYbRBzz1kYKanCVDz7zcVQ0boC96IqY6EI+wWtzG+gCGJjAlXvErjF6tYA17/olU5Len
         pK9w==
X-Gm-Message-State: ACrzQf33mvhUyURUkR4YrxpgfMSaxVhMgtjmUhpYuxzivJsnqf8TL2FK
        3ZpjO+Po/sYX34+phBEtz7A/6IwLfJPkBzTvsTE=
X-Google-Smtp-Source: AMsMyM6274U9CSV9jS9j4sSiJo7SJDRlLjGDU/QLOYECQpB4iP3Nz6Ppvc0kLlWdLIaO1R7n8GYAww==
X-Received: by 2002:a05:6402:28ca:b0:43b:5235:f325 with SMTP id ef10-20020a05640228ca00b0043b5235f325mr27711161edb.320.1665587688434;
        Wed, 12 Oct 2022 08:14:48 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906058a00b0073ddd36ba8csm1378221ejn.145.2022.10.12.08.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 08:14:47 -0700 (PDT)
Date:   Wed, 12 Oct 2022 17:14:46 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Vadim Fedorenko <vadfed@fb.com>
Subject: Re: [RFC PATCH v3 6/6] ptp_ocp: implement DPLL ops
Message-ID: <Y0bZ5nUGC09tX443@nanopsycho>
References: <20221010011804.23716-1-vfedorenko@novek.ru>
 <20221010011804.23716-7-vfedorenko@novek.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010011804.23716-7-vfedorenko@novek.ru>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Mon, Oct 10, 2022 at 03:18:04AM CEST, vfedorenko@novek.ru wrote:
>From: Vadim Fedorenko <vadfed@fb.com>

[...]

>+static int ptp_ocp_dpll_get_status(struct dpll_device *dpll)
>+{
>+	struct ptp_ocp *bp = (struct ptp_ocp *)dpll_priv(dpll);

Avoid cast from (void *), not needed. (I also mentioned this in RFCv2).


>+	int sync;
>+
>+	sync = ioread32(&bp->reg->status) & OCP_STATUS_IN_SYNC;
>+	return sync;
>+}
>+

[...]
