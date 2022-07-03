Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D06CCA480
	for <linux-clk@archiver.kernel.org>; Sun,  3 Jul 2022 04:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbiGCEBM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 3 Jul 2022 00:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbiGCEAC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 3 Jul 2022 00:00:02 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87197DF44
        for <linux-clk@vger.kernel.org>; Sat,  2 Jul 2022 20:58:03 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-fe023ab520so8803735fac.10
        for <linux-clk@vger.kernel.org>; Sat, 02 Jul 2022 20:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0RqgirN7BbHsC9UQ94U9L9bhvHlaz6I8H5K/QJE4CSk=;
        b=KmfWKyrq2EChkZJSLOp+rwX/KH0kL85vtV4uD/TCtw/+zcmcQVqTCsUbQyGiE7OKZu
         0Nljm4H7HRlU2mTckG2UVnAir1SDdqKnCf7T0ogU5ZZvIrE7cykTUN0TsIF1D3cea+TQ
         WYCtz3KbkBzJs/EnMQniihYXFyrm4JUZ9JvyuapfzKM07PfdGnDAPYkWWy3E03CAo41n
         Q5lZ7gZqTW1H0kG55BexKpDvu+TtJiUdU5xGsk/jm+445YPEis2IiRVeN0TjTL3Ho9Wq
         NY8GDMEtwXyp6khZniCLqgQNHhXcnR/nT4Q32bsP0g3ETQ2UuSlO0JDbrUXPxMkBVGM5
         /Szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0RqgirN7BbHsC9UQ94U9L9bhvHlaz6I8H5K/QJE4CSk=;
        b=o9M1TJJY1juZUgWjkAeU9nm+rskb6GUVGLOyooKI1H9gUsCJO50mbaHd8SY1Owk8BJ
         93B0TJ0BCmRosc1vHaYq8nsP82aCkljeZnZfdhivqQZM/yyDTUnybxfgNGm97G00jruA
         YiCcUGdaMwg+nv9kYiw5mO94I0xjEGSuAojZBdHhrEwk8hSfXkPsxYg7xcMVEjcJ1b86
         8I/CqXNIxYmwaUHSdxTCySq/bDaO2Wo/0P9iSkTaBIvxU1bJRk1P4EXok2b8rPCEF4OL
         VqsHVyQRJ1/99Puzfz/a55ZwuB/ECvtXoHPxS07+a/LuEChOLGYZRRGm68Thwj/36/tn
         z3Pg==
X-Gm-Message-State: AJIora+x95Y7mCUK4R6K7c5OUhlhQECeGC6XjcCRDLXrrfuqkQt61RwA
        hPT5GCeAKAlRm6LHmErb3oJ91w==
X-Google-Smtp-Source: AGRyM1uhZrXXBJ/Xo0ltwV4HMYSe8dRq9X4xTR37eLbQyJ1iiFKWE9ahSU9lsNuJl0jthRnxB89r7Q==
X-Received: by 2002:a05:6870:5494:b0:10b:8bc9:38aa with SMTP id f20-20020a056870549400b0010b8bc938aamr12020450oan.20.1656820683002;
        Sat, 02 Jul 2022 20:58:03 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:58:02 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Robert Foss <robert.foss@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/2] clk: qcom: Fix topology around titan_top power domain
Date:   Sat,  2 Jul 2022 22:56:55 -0500
Message-Id: <165682055970.445910.5680460160488925344.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
References: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 20 May 2022 00:41:31 +0300, Vladimir Zapolskiy wrote:
> On SDM845 abd SM8250 platforms two found VFE GDSC power domains shall
> not be operated, if titan top is turned off, thus the former power
> domains will be set as subdomains by a GDSC registration routine.
> 
> The fixes allow to drastically simplify power domain management in CAMSS
> driver.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
      commit: 103dd2338bbff567bce7acd00fc5a09c806b38ec
[2/2] clk: qcom: camcc-sm8250: Fix topology around titan_top power domain
      commit: f8acf01a6a4f84baf05181e24bd48def4ba23f5b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
