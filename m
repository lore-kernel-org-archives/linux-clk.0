Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D482C32D0FE
	for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631407; cv=none; b=UMnOdPYPwUDclVMhS7Sf4PLh/YrUQbU7leC5Ng+xdfqcdHk8v8RBA/Sye77hclesF49DVUpon7eYW9SIRzQe7iV115LphsC0TT//jvghs65ddvAPK6GK43iUhuJaLiYdXQvxoY6Z3y96JToAcYvODoDZaYAHI6gRM9z/CGvNQ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631407; c=relaxed/simple;
	bh=g14jRVXRif/yu2mldUqo+ZtgbpRULfrZaOhR9foeWp0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FS7kgJu48RyoYzRPc8LhwoU2VDg8U75qh/GamKSpm3GDL5fN11cqevqKotn9+Hker5/DkNOhdOAKb1vpvTBNP3cJn/BOHkG+fCLdhsejr7+QxhXU4AAg2IKIdCZ79XWsWayvqDCqwVoi0rr06D6na42b1tIR4scwKx2s62MkJ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K/X7G4Y8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K/X7G4Y8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rLoW72TXy8BUJKs73yrBx0QtS/ByaYZC6LqSSduX5pU=;
	b=K/X7G4Y8ZjMrZL25mJxnQj+7NFrJt2ae9qAUYl2IpimRRa7e5I3b3DfsrTkPilBFNxTq+t
	6JB9J3XTwUktzfECO0MsxgOZBvz8inT4f5z6ctvVcRbE3GHSSLZDCBDEyoA1KLuPiob83W
	eJmcl43VBgekVdkBN/+e+RivyjwWNiU=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-6-z-yBfTuhMculxKtsbxzZZA-1; Thu, 16 Oct 2025 12:16:42 -0400
X-MC-Unique: z-yBfTuhMculxKtsbxzZZA-1
X-Mimecast-MFC-AGG-ID: z-yBfTuhMculxKtsbxzZZA_1760631402
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-54a86a758a9so1345577e0c.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Oct 2025 09:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631401; x=1761236201;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLoW72TXy8BUJKs73yrBx0QtS/ByaYZC6LqSSduX5pU=;
        b=vNTwlY4Nn9v8+fa3OvqnB84UDL13F2OeiuSS/N8o0WruHZKEvxE1f2z2cQIQoHplcm
         DzeahREjbvnCTnQuAUhtRZ5Q2mVl9K9rzBRqIn/hOf4Ej2UNq68jHL+ekqnB9YMEhc+r
         sDRKAZ5TrlGXYBqcbI7PdNpkPXKSvEtlNt8HOpuj7kkMLucWgFPOTqmtXsGIrxb6bnB/
         lkU6upBRyGUMV2/1bjPF8H4n7i+aHcJSrqAZWNoDCoYjarBFgoC7a28S94NndWd+CshM
         z7C9kQe2Pg+kyyv4jfnXDtFpg2Gd0ELebVF6605h4Nx3+RDBN9Ez+uoeMZ9OAM3xIdz1
         te6Q==
X-Gm-Message-State: AOJu0Yx6UOibnuGHt0x2GtfU+FWj7PrdKTQ8roVs6YFApAqCv0JqC/Or
	NMfrRbrPOIJSZjLZJaJD43tIkTQRdG/5krce5HkOdnik78wAZhr/quZY36l3+3Yhzi1jap4pH3Q
	cVEp9Hb1cgzfpD1kZs7j9C5A9T798Q+lFQT1gMcq8tOVdhgGRFKGcWbAUZux1yaU7eaVoRUDysV
	75KGkwZx0o9JtOi2IgZDvKVVmviKFGr/iuWHhNDwu3sAn6
X-Gm-Gg: ASbGnctHZfqUXTj25+mXBYe0IanEK98FVmDRS/lpMfNRIIfGtnS0cHJmedY6i8KXDp2
	pL0WxkMytNadZw1iBz7+qrojMpjNSNo9vrja58RX8kX8GR/z7P5olkrwCE0IFE9BWaHPH7lCP/S
	lxm2b7Rsp7zKEOY2uLo9u2nSeyKIA6y7os5mtYZHBA6zPCmtk8HlE8Dup4okHHThVdw31+DEapE
	waRny4gT1J2CngmXqRseBJePbMoTb2kiNieN87PdidqZHff8x2ImaABBnOKg82C0PaHeNEYiOex
	+mrGCf8qtca8D2x4KYMIWqyG26vmGCwgiG0pbEwtTXRiIN9HnYX/vD2wYGBcFtICr4dqXqVUa/k
	DGJIx/StNCCKy7UJ6T45a2R32KkfwjvldAhmyRd7WdYFdfVbyfv8VUmuwAfHKkxqzmFO3/A==
X-Received: by 2002:a05:6122:e0db:b0:54a:8deb:21a7 with SMTP id 71dfb90a1353d-556401f5a2emr1266689e0c.4.1760631400754;
        Thu, 16 Oct 2025 09:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/qxbT4MGn5K5SdF7mHb4J1RwbE5sf3ZLdQeaLqWF3gk/o9djqJacUmDf3uaB2gYHOqJNprw==
X-Received: by 2002:a05:6122:e0db:b0:54a:8deb:21a7 with SMTP id 71dfb90a1353d-556401f5a2emr1266639e0c.4.1760631400331;
        Thu, 16 Oct 2025 09:16:40 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm44068466d6.33.2025.10.16.09.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:16:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH RESEND 0/4] media: convert from clk round_rate() to
 determine_rate()
Date: Thu, 16 Oct 2025 12:16:25 -0400
Message-Id: <20251016-media-clk-round-rate-resend-v1-0-446c522fdaaf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFka8WgC/x3MsQrCMBRG4Vcpd/ZCEzAtznZ10FEcQvKnXtRUb
 lSE0ndv6Ha+5cxUoIJCh2YmxU+KTLnC7BoKd59HsMRqsq3dm9Y4fiGK5/B8sE7fHFn9B6woqG3
 hkg2+61PnqB7eiiT/7X6l83AZTke6LcsKPh60hHUAAAA=
X-Change-ID: 20251016-media-clk-round-rate-resend-2e6f2ca78f76
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Julien Massot <julien.massot@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5312; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=g14jRVXRif/yu2mldUqo+ZtgbpRULfrZaOhR9foeWp0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDI+SqW9unN9Ss/ph+bzdNJE1FZy+H1jFr71bQ9TmHBDv
 +W9dSfCOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIyniGP3znXqvMMN11uvzk
 Wa43V/9qHSovEkre/q2y92/Dly//xM8w/BX9xpjafcDU6UVukniZbJdwjvYLJ1a7F7UfVZL9oxO
 KuAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

NOTE: This is a resend since my original posting received no feedback.
https://lore.kernel.org/linux-clk/20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com/T/

I'm hoping to get this merged so that we can remove the round_rate() clk
op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the media subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      media: i2c: ds90ub953: convert from round_rate() to determine_rate()
      media: i2c: max96717: convert from round_rate() to determine_rate()
      media: i2c: tc358746: convert from round_rate() to determine_rate()
      media: platform: ti: omap3isp: isp: convert from round_rate() to determine_rate()

 drivers/media/i2c/ds90ub953.c            | 12 +++++++-----
 drivers/media/i2c/max96717.c             | 16 +++++++++-------
 drivers/media/i2c/tc358746.c             | 12 +++++++-----
 drivers/media/platform/ti/omap3isp/isp.c | 10 +++++-----
 4 files changed, 28 insertions(+), 22 deletions(-)
---
base-commit: 2433b84761658ef123ae683508bc461b07c5b0f0
change-id: 20251016-media-clk-round-rate-resend-2e6f2ca78f76

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

