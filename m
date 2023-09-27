Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB9BE810D2
	for <linux-clk@archiver.kernel.org>; Wed, 27 Sep 2023 11:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbjI0LYa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Sep 2023 07:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbjI0LY3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Sep 2023 07:24:29 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05187196
        for <linux-clk@vger.kernel.org>; Wed, 27 Sep 2023 04:24:28 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c09673b006so78707095ad.1
        for <linux-clk@vger.kernel.org>; Wed, 27 Sep 2023 04:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695813867; x=1696418667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vmVJzfHE3vQ/lTZ+43o8mLraNAwtCdKaHY6VtnSgr7U=;
        b=ZmH/kC9lLlp3gWZkDTK5S3BptRT8iVEgK6HbUP5+EZQquHBz7qCrIwgGkSohKD8HLX
         KPPv0BT48Ye2oXSOX/wovoeE7nlSXD5wd0e+w9pGU6BU+wFmzD1U34BcdL9rQ4IK90QV
         fTZOp5c/GszVy4zw0kzTZp0ryrvC/LrqoOmIvv+4jHaD0+sp/7UykfPQ4/mEwF1dLO3T
         SYcdPQF/+5tLahBP19v1DBbYHDB38N9ZvwpmSGkcOs2KDrZAoklDP5CDGMVCK0ZloMaM
         D5tEL+r++iE5iBosmmyQx2fC7bMBIb0PMhzC1y/5tFEiMgaNLof/++hddmvz9ZpTF6O1
         PVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695813867; x=1696418667;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmVJzfHE3vQ/lTZ+43o8mLraNAwtCdKaHY6VtnSgr7U=;
        b=YkWGZBU0U3onEaTl71+X0/8lktzrW9f9yYz3F/XGR5WS6CYD81EW/67boInEw3LrUY
         tQ8OHbSnPXTd/PbIWzasjPpLaQlU4iUEC6jGYfku6/XMUnOvXBGknxtO6bQVZ3XsPsj4
         dZ9zStE1oDl6UyTYuioOl/6SxYK/r7NZ3mZJgC9QOKw2IktozrbzNg+F33SQM9apZ6dy
         GgzWEHE3LlO5PjxSeiz9ZUaziVjUomdZszRhE7qWjMvUU6LLf8oruUwJvGFrM/KmfN2u
         St9FyBcpiJXe7pyG6CMROtAX5yArbyFosaI7sqKEBP1/mHBKfO8QIaSGsMpB/QleNfei
         F0xA==
X-Gm-Message-State: AOJu0YwlNuwZpt0TVE1in6uI8iAy/cxiZE3xT7ilEYKP2YpVSJ+GqxFY
        tWi+9QWk1gfVr5zcrXb37ggVig==
X-Google-Smtp-Source: AGHT+IGj48IsQLfFZkeOQC4tbS38mJkUy5+WRSSa3+XW5UWtGE4ixlhmRgKJ3yIrY+gEMnfBOkHekA==
X-Received: by 2002:a17:902:e5ce:b0:1c4:32da:2037 with SMTP id u14-20020a170902e5ce00b001c432da2037mr1427219plf.64.1695813867494;
        Wed, 27 Sep 2023 04:24:27 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001bf11cf2e21sm12751587plg.210.2023.09.27.04.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 04:24:27 -0700 (PDT)
Date:   Wed, 27 Sep 2023 16:54:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Varadarajan Narayanan <quic_varada@quicinc.com>,
        ilia.lin@kernel.org, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, rafael@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        quic_kathirav@quicinc.com, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 05/10] dt-bindings: cpufreq: qcom-cpufreq-nvmem:
 document IPQ5332
Message-ID: <20230927112425.763qlhilfld5lecd@vireshk-i7>
References: <cover.1693996662.git.quic_varada@quicinc.com>
 <8fe23b5401362e214078648926a00f7ceefaa542.1693996662.git.quic_varada@quicinc.com>
 <3f68d3bf-3273-2339-ea41-3362ced3c91b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f68d3bf-3273-2339-ea41-3362ced3c91b@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07-09-23, 08:03, Krzysztof Kozlowski wrote:
> On 07/09/2023 07:21, Varadarajan Narayanan wrote:
> > Document IPQ5332 compatible for Qcom NVMEM CPUFreq driver.
> > 
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied. Thanks.

-- 
viresh
