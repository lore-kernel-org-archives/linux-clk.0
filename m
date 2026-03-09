Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E8B3D523D
	for <linux-clk@vger.kernel.org>; Mon,  9 Mar 2026 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773067181; cv=none; b=KUFK1mgrFFtgqs9dsG1leO6bI7Esdnf4hymKxE8fDN8+fOUMB9xdVjuFqDiT5leIzplz4Z0xZFM4FSEbBrLdSIy6cRRQui8m9p1miZIdJR9AmhzimZZx/2o3WYpi6f+dQu40Q07zPHjmx1Zq1qAZ3P6bDahMrM3nheXnUfXJDd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773067181; c=relaxed/simple;
	bh=GIQeCWpXzFUtNJp/mJUZgo1pJ+8bxueWsKYYeUgP+vk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GT5PBtSoqk8LpQkZyvN2E6x/3QGGFTcnoZmpTnUOrn94p8l7szjjt0JfiNBOjW/hjtezS3vP1BVSuo5AnSBZGyceEN70ScmtXCRF6F2vHRhgC4TNIcELGS9jl51IA3LMfZ7Paieu5W90AHQ/tLMc9W8zRFZWgcD/2H7P9Jf8WSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IlzwUbML; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=F4UmYHeh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IlzwUbML";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="F4UmYHeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773067176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJJogOm7mAlsex83R1hkauB1mXrgfQo2P5H45OLn0pU=;
	b=IlzwUbMLYyvOay7dxHEsbotBO4UrtlsynbHn6eS91gMH357ExK8mxAEyH55OOnmmYI1KX+
	4MDJNqavM4wWRpnapRK4IpoA4z+neMqvyoxkyAhFtMFTSZXBBSlU9uIZuPPjirz5FHQgv5
	X+52VhElUP5drF5QfFjvyyVIKuIimmg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-v0RrM0RcPEuQztQaykzIDQ-1; Mon, 09 Mar 2026 10:39:34 -0400
X-MC-Unique: v0RrM0RcPEuQztQaykzIDQ-1
X-Mimecast-MFC-AGG-ID: v0RrM0RcPEuQztQaykzIDQ_1773067174
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd722c1a69so1394133285a.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Mar 2026 07:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773067174; x=1773671974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJJogOm7mAlsex83R1hkauB1mXrgfQo2P5H45OLn0pU=;
        b=F4UmYHehGdVzWmG48Bx6F/ehhCJidT26fHoEgBmDy0onZo35s01nn5ES+Kf2IzL2SF
         Z1wzr7+J8YAelS/Nhrkhucm+MY84BHgfi1UjnmVW87u1QYcnQFtsJxKrDc5CrqDNHyU4
         UNJfzEY/MGIU7EN3Fai5+5+NffTTzfU8eEz+/wfx2uTZa2O3FKkJjUaN8UrlF1EVvGEH
         h5sIo3Tb5RK2Zdb6hKF0ZjXJdu4PRjZRer/Pp/0vIkZal7QYrC5JDnABLvNbTTY0LS3I
         7LNQsLUH+f27hJdiWNA+0yuDeyD3rZgV1HJtvMS8RXPRt7++mjXe+DeqPn3fS7mBo15t
         BjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773067174; x=1773671974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJJogOm7mAlsex83R1hkauB1mXrgfQo2P5H45OLn0pU=;
        b=VuOXYtePZCSEH85EBznuT4tOdcLZ7E9d4EQ7LVHbHsIbHmsBBbsAi5kyvM1AryyUVS
         0U/x5OwxDJsJIy4T3C+6Z2ITLtRn5e6DadHMzzFd3uKUTGTpQX/vsB5yumQJyrkovEL9
         6EVYCJBizDNR5RfFZnQSxjW4WI3OyduHSg5K/DF0D6qnAhrHa3MZxT2o0TanmavqpN0F
         HSjYnrUZBP9eQ6Ym8VAaSag8X2moujS+eV2KGYJNqIMZ0xKuVQlYLJTcKm5PxTDmxSVE
         hLgMt9+1s+/IhTCT73XLwER2XDVgRYuEHnhiuLvIH6LgxlEVCL86pbz/VwCDnn0md4r0
         V9gQ==
X-Gm-Message-State: AOJu0YycRVoZYxyqrnZdoCtbVfiwfgI85NjN38NGRwYe276mSXyIifdi
	OwaQFJEbzpm1ZgualuN4oEZPF4DatqJmzLMz2DivPLag2RbN4eItPt0HsLO8WuPkrxtZ4kggm3I
	9H74F5/uLvhaZN4HKdbnFtIQf8H+dgZxJ+MZCs4wdC6o+twQTtrWNf6bIq0QIUA==
X-Gm-Gg: ATEYQzwogtgp6RuRjejlRq21RGXkweIs1sSw+JMQ3TEelJ3U9cvTYI+5FYs5BL/Ytde
	Y/kO9QH+qujmnMUkRFzKTdtbKmrYzqcjPsdjSyh1A8USQ3kqvl/iO1MbaBISfmozQrlbrm+H/z1
	V2Ww4WOYkU7fveD+kOjAg+dLWMmYAOU8xAlFjIEz2iP5lvBKUyJ0kEE5qFrVg0Zn06F9+Rqgp/6
	Zqv8ZoF/78a3fN6ar0b5f5ovDdjrJS1owfspT9kqKExRcniCu/lRqkWSnTcn1JEvp+uY7N9qgFs
	EJBjbyjZgiQZgqqHegDz3r0Il47K8n0vBm3fNIHbq4hyI+JZb6N7/ki/F2FZXahdidVpcwd1h3i
	AEYS0in5vYN+FLHxKgSwSxtplbasodiVBVsj3SnxH/qemvREAKto9NINpWCMP3g==
X-Received: by 2002:a05:620a:bcd:b0:8c9:ebf3:7623 with SMTP id af79cd13be357-8cd6d3847f8mr1387164485a.20.1773067174196;
        Mon, 09 Mar 2026 07:39:34 -0700 (PDT)
X-Received: by 2002:a05:620a:bcd:b0:8c9:ebf3:7623 with SMTP id af79cd13be357-8cd6d3847f8mr1387160185a.20.1773067173790;
        Mon, 09 Mar 2026 07:39:33 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd6f49fcafsm756064985a.16.2026.03.09.07.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 07:39:33 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 09 Mar 2026 10:38:46 -0400
Subject: [PATCH v2 07/12] clk: imx: scu: drop determine_rate op and use
 CLK_ROUNDING_NOOP flag
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-clk-det-rate-fw-managed-v2-7-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Peng Fan <peng.fan@nxp.com>, 
 Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=GIQeCWpXzFUtNJp/mJUZgo1pJ+8bxueWsKYYeUgP+vk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDLX3Z4oJ3R3zSTjPU8qrm2YlCE1aVbV7+2GsQknTcoOH
 u/9VXNgX0cpC4MYF4OsmCLLklyjgojUVbb37miywMxhZQIZwsDFKQATydvN8JttUR6/67KHqj2N
 jU02NcpW0pUXDouve7JATG36Du4NTmEM/wz5HP7ZnliZvbBZeUPmgSXZZuwM3VuKa/ydc/JZFjP
 p8gIA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

This clk driver has a noop determine_rate clk op. Drop this empty
function, and enable the CLK_ROUNDING_NOOP flag.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a39c68d664655537e81df55c7e6d32304de9338a..13fb77562b031bb82d6fa2d19f9092ed33966aa4 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -262,23 +262,6 @@ static unsigned long clk_scu_recalc_rate(struct clk_hw *hw,
 	return le32_to_cpu(msg.data.resp.rate);
 }
 
-/*
- * clk_scu_determine_rate - Returns the closest rate for a SCU clock
- * @hw: clock to round rate for
- * @req: clock rate request
- *
- * Returns 0 on success, a negative error on failure
- */
-static int clk_scu_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * Assume we support all the requested rate and let the SCU firmware
-	 * to handle the left work
-	 */
-	return 0;
-}
-
 static int clk_scu_atf_set_cpu_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long parent_rate)
 {
@@ -436,7 +419,6 @@ static void clk_scu_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_scu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_set_rate,
 	.get_parent = clk_scu_get_parent,
 	.set_parent = clk_scu_set_parent,
@@ -446,7 +428,6 @@ static const struct clk_ops clk_scu_ops = {
 
 static const struct clk_ops clk_scu_cpu_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate = clk_scu_atf_set_cpu_rate,
 	.prepare = clk_scu_prepare,
 	.unprepare = clk_scu_unprepare,
@@ -454,7 +435,6 @@ static const struct clk_ops clk_scu_cpu_ops = {
 
 static const struct clk_ops clk_scu_pi_ops = {
 	.recalc_rate = clk_scu_recalc_rate,
-	.determine_rate = clk_scu_determine_rate,
 	.set_rate    = clk_scu_set_rate,
 };
 
@@ -491,7 +471,7 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	 * clock status from HW instead of using the possible invalid
 	 * cached rate.
 	 */
-	init.flags = CLK_GET_RATE_NOCACHE;
+	init.flags = CLK_GET_RATE_NOCACHE | CLK_ROUNDING_NOOP;
 	clk->hw.init = &init;
 
 	hw = &clk->hw;

-- 
2.53.0

