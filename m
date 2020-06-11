Return-Path: <SRS0=Q/ZM=7Y=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA77C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jun 2020 02:20:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D88E2078D
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jun 2020 02:20:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUsPqWw4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgFKCUA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Jun 2020 22:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgFKCT7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Jun 2020 22:19:59 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC4BC08C5C1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 19:19:58 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id k2so1616684pjs.2
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2020 19:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qp13tuvoDI624Us4erIpZQOfzK+3SpKh+xFk7AN7Uf4=;
        b=lUsPqWw4x6rYCi4XZYGhdSOrQyAmNtnaNDse54/afYWKoVwkgkEiNCljvJ11ohhvUK
         3R5Q4AUSjwKUwv+LMkxqNStA6eJMEd3nzG/bzPR+KJLHhkGduQ+4hxT4xcUlCIKlSIhX
         BYPBvlXY2Ky3vg/bQtzZcBywcpvHiy+aOgs0yAZh3uiykS4j5Q6OxKSQk6wJosdMtC5Y
         ACy+PmcHEeK9/Zo63OPRrjvEtxUc/ybKjHWtHplU1dtqIQon7SUHztuzCs994ITB0Z0V
         mNr3SylVpy9EPNnhxOdjW2XCtvg7N2KzxDiKV4yC29BNNLL3r6WvOCspkQEKdJnXOG1t
         ZzDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Qp13tuvoDI624Us4erIpZQOfzK+3SpKh+xFk7AN7Uf4=;
        b=GZjfDUQNvcET2YdH0Ye0sPrfqkdnau5VBqkWeH8zRm/WbZQyvC/Bm38iJB6+Y+xro7
         KbQnv7lPi7grCrIwYLI7XiRtlati7wh888mO9tRD1Peb/EqoyoVSUWicKE8VULSEmTJ+
         GfRxoXen+St8tXUTQTLjzrRdOC9ex/qHHnuMADFFZLHSuVLeOvU+ePRn5xw0tmBe4Yzi
         S/FG2Jd/Mdl7ZcyfHfZ+Xbd7GVLxlw1YjRGZiY0+YQejEMYcTIA/9zdlD3fV1QM7kqWh
         MjU52YCdsLXJOHDGSfnLUN9tkx+V6rvSV42GOXCi05H2/6s61jP7nI638f9vBXPMt2d2
         eKAA==
X-Gm-Message-State: AOAM532qo0OWaVy93iiwWvx3v1tW337/2E75RlzJ/AadZD5135XkutwB
        yaCFUct0QFZq0pdPA17NP4Qz5maQUIvov1LS
X-Google-Smtp-Source: ABdhPJynzgVcp2VsqSj4PcEe53ujlCSsAAc1/y6TPLWPVE1Wng4isAycXDiFrxFHkxX/Qz+AbqEjVg==
X-Received: by 2002:a17:90a:6706:: with SMTP id n6mr6122684pjj.13.1591841997366;
        Wed, 10 Jun 2020 19:19:57 -0700 (PDT)
Received: from ola-2jp9dv2.garmin.com ([2605:a601:ac62:2200:56bf:64ff:fe6f:26a])
        by smtp.gmail.com with ESMTPSA id i19sm947488pjz.4.2020.06.10.19.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 19:19:56 -0700 (PDT)
From:   Sarang Mairal <sarangmairal@gmail.com>
To:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Cc:     Sarang Mairal <sarangmairal@gmail.com>
Subject: Re: [PATCH] clk: add function documentation for clk_hw_round_rate()
Date:   Wed, 10 Jun 2020 21:19:40 -0500
Message-Id: <20200611021941.786-1-sarangmairal@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610151744.35478-1-sarangmairal@gmail.com>
References: <20200610151744.35478-1-sarangmairal@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

> I think we can use the 'Return:' and the 'Context:' sections in
> kernel-doc[1]. Can you reword using those please?
Yes, nice suggestion! Thanks.

Hopefully v2 addresses your expectation.

-Regards,
Sarang.
