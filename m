Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A442264C7
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028646; cv=none; b=dqYWbU/JSSoaKRPRBFk2TCHOJ1COeassZB1J1CpFVvKnKcMlvt3Ddv4RcYZbSgCSdNH3fV9/lC3jek9Z+tvaTolspjFZ+hqbRDMGNDi0ttEoIr7wsZSOFqNWnJB+Ou8GeAbXE4L4pJ/Z9YGXYPo7WZPyvgcWrvZHpoqIK9uBj84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028646; c=relaxed/simple;
	bh=PD3f6GsDvZWDfVLwGVYg0tTAVyKMk7bCEAdc762fhFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cBCnQdTALbtSN9NyCaKBResAvf4o654xDZDTwT4VrqzbzZLIhD+kYx5NVufwzKu4HXQ+zsGRQjpmEGi/bQCne/vFF3W+7O1q683euKHnaPkDiuqlgmNZiSZ0/yP2LTx9NmQaoqSHifmvcmXE4Nn1wv+kWx77GJptuugfjli3b+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=flplZaOe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BuYAquAL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="flplZaOe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BuYAquAL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iHzfnN2CwgbOFP/2lca/gpcRHdEHuCwhiDF4slnOm1Y=;
	b=flplZaOeG/6OULyklUeaxQqen4QyqUvgySIJOVUHrkDlHGiJ8WhS0HXpFPKBiwdGWwMqPn
	qUFoB4H+IhCpvMOqU0yDARgXd4OAgx26J5EzjVydZUKZnSKBmNdeLeUYQwgKOZcqlKQ1SN
	1NyyRanIturZ1JACLanjF5kpg/J2xv0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-LJOuXRqKP7SDmTtvEYH0xQ-1; Tue, 05 May 2026 20:50:42 -0400
X-MC-Unique: LJOuXRqKP7SDmTtvEYH0xQ-1
X-Mimecast-MFC-AGG-ID: LJOuXRqKP7SDmTtvEYH0xQ_1778028641
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8d60fca52b9so1053324285a.0
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028641; x=1778633441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHzfnN2CwgbOFP/2lca/gpcRHdEHuCwhiDF4slnOm1Y=;
        b=BuYAquALPPxS7YXgVcGGsQeyAMkvDHi1czIZLr3yUvRpMASan2krr5LQFjNtbvNJJi
         J7V7wEFyiYqPq7yuQ6m6h19EIG2JrtPsCx/beRbU78S+NWnVNDYSB77fWSmS6cIzPzLX
         k24xDos+eghDsyWn4FuwY0MgCReZxZEwfMjugger3WJt9m4ghszsint8xtay2C9ip7YN
         0su+PcV0JCL4WcTIhxPN0BmxJyP4SHgGYrIsEcaVeRS2gyr/sAHclckDid0c0fAaVclX
         s5sXcjzjCc9FWcOEuLPTECzC3g0Qc43YRKr3Vg1NVnFWSIeFHFB4IdUsJo5jE8Jwdis9
         NOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028641; x=1778633441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHzfnN2CwgbOFP/2lca/gpcRHdEHuCwhiDF4slnOm1Y=;
        b=fZ4ZCjCwmF9baiow4mUwt7SSWhaQ7RWgpZ1LSzphLVRsOh4KnP8fbZjnxbxI+UFmGC
         dcaWfQ6QB4G0E/xXg4CZDOSRvysZgGDxXYWpBFJu0GYL3kCsmzrIn1MtMsO3ZLgtpRe4
         lAPWdPXeZuevs61kE9ts9qbOHsPDJpMMT3AyPAR2ifVTRE63h4/L6YlDCBXGmnYs1TpZ
         dy0GJHP2EuV4r/fxTVIlh1NmuxMokLwX8NaWxYzy3dKKy9DBTT2MLP80E2MtJm4vUWjK
         CtK87p3HOXxNge/eEXalg1KtQPgO9hsHMpcUOvbXUXi36T9xuY1QncQfGAbd474JWMfC
         dODg==
X-Gm-Message-State: AOJu0Ywb4WJs75EGCIeGV/KqZuBwF3cQ/7N1M/z5XPKKZWQ+IYZuLoyw
	1S8XIygeGDViSqvvNn5H/aXEhTyt6UbcKa1DH4HKJOhEYdX5ww55SAciBvxw0vkKddmJPMdLvxw
	aBhRJPlI2YAcOFgM2OrgcW5AxMZtQGj/uQGvT1s5OZF+nkIYbUVJJujcFA1Jm6A==
X-Gm-Gg: AeBDiesF9FKKeQ140f0fbc5BtIFec6WjoQcbeRv8juH79/N1PQpVtlmAsT3zVYhHn8X
	hv6cMAILBEwIRqwdbQOr8F+UqWyM26Qh88Zg9QbPc2sUteUqKqvygcDdK3Qc84Bay+C5dAzFB/J
	CvBZeqAnzUXhup+YaKor2RnqIGaaLP8Ls+p4rdiqWIBTY9ZkTVSRGEBlog6Ps+6oPFXJeThJaeL
	SiYd9IpQoIWWzYOKACx5zkhKESfN9shzDNh7EWggpz3BlejexgWtQ0RyKINQ8Nv033VAJo6DTRO
	u0TW9OMA5gEhPw2fnUWwpn+MOoQb/4TUwU0Muw8rtmGBXHBF0PwZDmQMOzITLO9wzXzGvNHwyPU
	ZkfSRYBWJwpHOQE6GjJKO2S38REUYCeF50Xid2Gfiy0UlDqVHbNdiTnyCo8RCdOQtt6zFCSTi
X-Received: by 2002:a05:620a:29cf:b0:8ee:1371:4f7c with SMTP id af79cd13be357-904d4d52ea5mr212185985a.24.1778028641424;
        Tue, 05 May 2026 17:50:41 -0700 (PDT)
X-Received: by 2002:a05:620a:29cf:b0:8ee:1371:4f7c with SMTP id af79cd13be357-904d4d52ea5mr212184285a.24.1778028640931;
        Tue, 05 May 2026 17:50:40 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:01 -0400
Subject: [PATCH v3 05/15] clk: qcom: rpm: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-5-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=PD3f6GsDvZWDfVLwGVYg0tTAVyKMk7bCEAdc762fhFM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfDQPTw3I6zOhv+1wiqzR/9M1d60qj/+sDeV/6aV2
 MyoWxa7OkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjI33MMf2XYlH1fL9Ocxh/Y
 yano4WMg1S1+WPnJ7FMWNzzFNpw4tJLhn/VFS0mdSq4g28Ipihp9M46ckeesOrmw03FWmn5uwCl
 PNgA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Drop the driver-specific empty determine_rate() function and use the new
shared clk_determine_rate_noop() helper.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/qcom/clk-rpm.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197..74f569b58017 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -351,17 +351,6 @@ static int clk_rpm_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static int clk_rpm_determine_rate(struct clk_hw *hw,
-				  struct clk_rate_request *req)
-{
-	/*
-	 * RPM handles rate rounding and we don't have a way to
-	 * know what the rate will be, so just return whatever
-	 * rate is requested.
-	 */
-	return 0;
-}
-
 static unsigned long clk_rpm_recalc_rate(struct clk_hw *hw,
 					 unsigned long parent_rate)
 {
@@ -383,7 +372,7 @@ static const struct clk_ops clk_rpm_xo_ops = {
 static const struct clk_ops clk_rpm_fixed_ops = {
 	.prepare	= clk_rpm_fixed_prepare,
 	.unprepare	= clk_rpm_fixed_unprepare,
-	.determine_rate = clk_rpm_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 
@@ -391,7 +380,7 @@ static const struct clk_ops clk_rpm_ops = {
 	.prepare	= clk_rpm_prepare,
 	.unprepare	= clk_rpm_unprepare,
 	.set_rate	= clk_rpm_set_rate,
-	.determine_rate = clk_rpm_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate	= clk_rpm_recalc_rate,
 };
 

-- 
2.54.0

