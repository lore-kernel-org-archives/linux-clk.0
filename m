Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D906D3D411C
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067177; cv=none; b=gXHxHaA08mGXXUOlrkFL6rv8eLHQoYv71+eMZiYlIpVu+DrCpUVKTn8oH3qOpkbPpBD0ghsdyKYQq5BuIW4HnCWSRbcF7/IR0FHKksSD6HlEMjQtxVpcpHACA+IQncNKcdk3R7VARSA4duz5ByNtngvKQeK9XKIUHUkG8ce+NoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067177; c=relaxed/simple;
	bh=XeetVznZFV71B7JCSzWi5KrN8Tz80v77RlIqT9sWHXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E+WFfV+uJlixTLkF5OOxvKjObxQlYP7M0VhoD5w1WbOOGEQ6QkFEGks3sTfon5Q6czLCbAtKEFH2E3HbPF0xZg2TURzJeLZ3ynxp/mTt+1oMV1L26HwSkVCd+3fkuW8pFfF3yCATJRWwYRCks1YYfkEd6U6TBlQu2JRTyaiVlKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dyyirOri; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tSIFnXbS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dyyirOri";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tSIFnXbS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7guZ++cg+GwW8cuHTbnapUzaqG8DHHsjWR9FGbXhSy4=;
	b=dyyirOri82hO2sxcAnAs7VztCWli2AYbk0tTwAXn/3SGIGPnOZH4wx4rI4WnhDFJgHWH7Z
	8MXhl7hNDM7JJTFeDGx4BO5ZOAPBgauxN6RmkAs66tIJeJ5Ur3jKEa4isWJBYvi35NzlqP
	9VgEzuDaT0c17EoT3XpKHRZd30HIdu0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-3Rxr-XDeOpe8voFR3VuqYA-1; Mon, 09 Mar 2026 10:39:30 -0400
X-MC-Unique: 3Rxr-XDeOpe8voFR3VuqYA-1
X-Mimecast-MFC-AGG-ID: 3Rxr-XDeOpe8voFR3VuqYA_1773067170
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7ea0bb20so899843585a.3
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067170; x=1773671970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7guZ++cg+GwW8cuHTbnapUzaqG8DHHsjWR9FGbXhSy4=;
        b=tSIFnXbSuIynukuH2TwLPG8SdCoQtpke6EBescIR1c5Bn5Nh8U4A3tb0paN/5sSr05
         wx6lxh70A0gG0bU1wDJi7UQNWUCNAG+pfbTblpq5NbUzhBRKRHyb7s5wYNRpe+CIZQb1
         H06v6QyjleVhXJ7KWr/zpxkyU5jwOJlY6xn+3kn/n6wRt/hL8A3xAyBq9aPuhJjcZk7e
         /gTmN1hbiYAXm0k+BcnF5ioTqCRW9tRgRQU/4RJnyHDVExIxBNjd0a2lX2tY3BNF43zV
         jf6LYlBKz2BAMOM+TnPENEHlQLvMRGmUWxavVnrx0TQ8QPndJV8wXY+k4bQnsQSSwaq8
         lKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067170; x=1773671970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7guZ++cg+GwW8cuHTbnapUzaqG8DHHsjWR9FGbXhSy4=;
        b=k37FYshWVmWjqdAcvYw3Gm2pjNmOWv1U7eBsNkxU44S/nE597El1BcIdOrAUcBIbZv
         fAZ4DTHqh6h9qgJ4yCdSl5mYUCd7ZfE8CB1y4yPR+1BV6+d05QWuEnRcLRK91ot3bpYq
         GktK6bhupxVHJ7nUFdiwbFHa6X2CDeyX1AJwlb1AApwUNo7QwI1DuTp1/TDiC9IibeUm
         PdA+jPfskwoQyd6mg2xxGq9EJfqfZsI7UBV+p3vBH/nmWkadvg849bgF3UAgcsjoOcma
         lEvulnAUecx5hR7m1euDaGu3VzihvgpazEaIOtGBL6L3tZWr8LYF+o9s8zfhHCM2mL2E
         HrEw==
X-Gm-Message-State: AOJu0Yz6IMxMgOoL4f42P7iLoYYrwwrfhlfZrNAvte5H1MRfjkTplBiT
	aZ50s6WzMbxvlCyKjYRr1nBDfk+MF61LqXaJt4qflTOAarjmmVORb41i+E7YmlVmvfognUNHDR9
	p9Nc287w6mwtb9dh8B6pc/9UNd05LzYL5Wf/Kl1boO3n9OegzTNRKppwWYjBkq6qDKeC8eA==
X-Gm-Gg: ATEYQzyR4Kk0pTfijipIhgF2WjIlLaX7d+8W7pb62ih+mKhOBBrm8UHuwx1cAK2eBKd
	mqEiNUyfTzAxcanqDo1qpD4BNXyeqR09+GqAQGA9zOhnPszljWjHsvp3gl4hV7hXa2R8e61YB+n
	q86+jcLASA/lkNXHa6stVTKdQdFHlpyzhiS5D87GEQ1h+zbMsvx3VED7eWpZWu9EzAa4ftoP+sl
	Qx2C5xzB+66JDp72c14YetOleCSyzHu7/XEnwWDh1Fzpz03JDkI4+7ODZMG/uKS6bH9WgNTQKwm
	9SaqqEPaxdaTzwMeSREvKP0Jv4wCMObfWiClHWPiNMEeWW1e056lAnZvwHbyBM3+91Y6IOV++k0
	pMKlo+opCUFqleaA+CYnZKxv8viQoITM+5SvHY8+mDfJevTMDVW1Ux7Eufj6kkg==
X-Received: by 2002:a05:620a:5313:b0:8cd:78fe:35e9 with SMTP id af79cd13be357-8cd78fe3fd0mr699601285a.66.1773067169974;
        Mon, 09 Mar 2026 07:39:29 -0700 (PDT)
X-Received: by 2002:a05:620a:5313:b0:8cd:78fe:35e9 with SMTP id af79cd13be357-8cd78fe3fd0mr699597985a.66.1773067169432;
        Mon, 09 Mar 2026 07:39:29 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:44 -0400
Subject: [PATCH v2 05/12] clk: hisilicon: hi3660-stub: drop determine_rate
 op and use CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-5-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=XeetVznZFV71B7JCSzWi5KrN8Tz80v77RlIqT9sWHXs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3e7vUAjqWLborOpjLy37z1LHXdicHKP+Subrr+7t4
 3ulWtncUcrCIMbFICumyLIk16ggInWV7b07miwwc1iZQIYwcHEKwETa2hkZuj0L3s6Y47Xc8vM3
 P/+CuLhihe4rHV8nL1L1SQti5z0pyfCHtz814jPr4ew5UpOq7hVo9Ss+39tx3KP0QreL8s6+o3N
 YAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/hisilicon/clk-hi3660-stub.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi3660-stub.c b/drivers/clk/hisilicon/clk-hi3660-stub.c
index 7c8b00ee60195e94f3b414bbf79ee5ec3cbf6c79..e47c7838f18503c3207ce6aa7789c2e78e8a4e2a 100644
--- a/drivers/clk/hisilicon/clk-hi3660-stub.c
+++ b/drivers/clk/hisilicon/clk-hi3660-stub.c
@@ -32,7 +32,8 @@
 			.name = #_name,				\
 			.ops = &hi3660_stub_clk_ops,		\
 			.num_parents = 0,			\
-			.flags = CLK_GET_RATE_NOCACHE,		\
+			.flags = CLK_GET_RATE_NOCACHE |		\
+				 CLK_ROUNDING_NOOP,		\
 		},						\
 	}
 
@@ -67,16 +68,6 @@ static unsigned long hi3660_stub_clk_recalc_rate(struct clk_hw *hw,
 	return stub_clk->rate;
 }
 
-static int hi3660_stub_clk_determine_rate(struct clk_hw *hw,
-					  struct clk_rate_request *req)
-{
-	/*
-	 * LPM3 handles rate rounding so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static int hi3660_stub_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -97,7 +88,6 @@ static int hi3660_stub_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops hi3660_stub_clk_ops = {
 	.recalc_rate    = hi3660_stub_clk_recalc_rate,
-	.determine_rate = hi3660_stub_clk_determine_rate,
 	.set_rate       = hi3660_stub_clk_set_rate,
 };
 

-- 
2.53.0

