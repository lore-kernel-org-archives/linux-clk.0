Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3ADB26ED37
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 00:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028651; cv=none; b=maRYpZsr0ZlGHhYMsLEgpuLXQhOf96vuPfiPiacXuJx+Y32zhfV4sJcgi7YDFHfK9KSrzmA0QRYoQhdAsnY9nM9t3yVJS3qD47DTrsqFhdQlXbPl3RhcYwtBxDICcDrPgcIqvze4/7DtLemdgQEIOh+swWbPaP8pR/iT+uaTd4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028651; c=relaxed/simple;
	bh=ZuwtT1UEtxCzGN9LoNJtI0urdfnTEDmvH2lW5lXk/Fs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCIU4C2aV404T6tFStSiqjWhsHzhHbVye2D65bOWoEk9dW46l/FnVOw7oV2r+lHhX11xFC3TZxUAnyKVo7GHBV3LDgvlxb7AtR9Mq1kMfLQoDTFPqhWasGnXuHqB1iEIy3Z9aRmqj9A02DMqLx2ylc2uEIHdVeJ1FfRJdvtHGeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N6hPkMO/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZARwYA02; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N6hPkMO/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZARwYA02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wHIZA/2rEhLJ2L3md6M1z/O0eTBApe1DK1hZwoZhMRQ=;
	b=N6hPkMO/h1aNExuEQg5neOsZXERVkwfr12gFHsoyW0wFdwXnP3dSF3oZezQJuOdTyfbEOA
	dhixs6KsV9VvXwuM9TkytTr5giCynuM9xmWdIMM8baNRq9FvtN2JUBQvFzcH+5zeqRz2FV
	Q/GMcZHPD/++lS2AyrVD9/Z9trEW0Aw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-D7eZS8KIOpa2FAVMo3TlBA-1; Tue, 05 May 2026 20:50:44 -0400
X-MC-Unique: D7eZS8KIOpa2FAVMo3TlBA-1
X-Mimecast-MFC-AGG-ID: D7eZS8KIOpa2FAVMo3TlBA_1778028644
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d4c2906fdfso694327685a.2
        for <linux-clk@vger.kernel.org>; Tue, 05 May 2026 17:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028644; x=1778633444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHIZA/2rEhLJ2L3md6M1z/O0eTBApe1DK1hZwoZhMRQ=;
        b=ZARwYA02pA1VA+xwvvLKEgPsNwG6xQY0P0xG+VIhslqaR0A7drZ2HdieZlLK2+QW/v
         Ag6gkjEpD+TwoduPG9N1Se5xcrDol4w7R/HNsAlmVW8bSBfgyPAZ6ZWWUUwNY9DR2qO+
         xlHTb3lC3O0Wdshc+fJmzQ+YDC8Xvj6Sb8hbXYl78Cunl8fJaITpaK7mBwQvy9RHhL0p
         h4LHHBi9ycBra0huPaxeKOUzIp7guV6bdM6/kawJJgnim7pB6EEyQ5waiBbUy14haoA+
         Yirsf8MRCpkA4rhMEBOa4Dqosv+4xOh9qZbuHzjEVDZZnZcGsC1NeIp9HkwPfOxh93Wk
         rxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028644; x=1778633444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wHIZA/2rEhLJ2L3md6M1z/O0eTBApe1DK1hZwoZhMRQ=;
        b=qTuQF2pPkeqlD0cWRBGXUup1ChBZr1ox/x0XviSY1jpB+3L8VzUqCjZTkEMIdolVtf
         MInxrCNslD4ieFRKWdSfcf2ufI8QsWnoK56YeqNbLyWVdtpCTrckXEu1oYqnY3j38Lv1
         4WJN2f4J30kPpZ8Jb8Y0dQ0JHNv8eZYKzjL2vo7jFRt3gmvjxYtA7kj6bFBwyvlEwzRm
         W0MsemqGBLJ6uv0qzyaKk4E1hdehc8ig9V11tKelRDVv56H1H+aDrcX8wh0Ow7E1tkYn
         oyWpBnCTwLGWukbGlzUpEnisYDDzULD30qtwzd+RUU3nC8nW82AxqdsCBQ/0fdKZBtZ2
         ZOgg==
X-Gm-Message-State: AOJu0Ywn7HmgS2vsVua9+xyPXwTx29zeimP7MBMgP50Mzj0vBKLR+oby
	Z3gq/u1saqsKyy9Rsk5mMEPq1e6Ju2/lrcnSTaloVy3qFpksThDdbSvmAhCaEcptKY0kuHbiwKS
	hE665GcTM+HKAJ8qG908xXRdsLzH66rK/GYUscvfcM0vkzqLRcBawVaFj2fudpfqeiAIPiQ==
X-Gm-Gg: AeBDiesxITGXc36VouFUqnmMnClE1NbmAeljLfyMhl9i4mqPATDk86yVdLbRZeFiQxV
	Bv39VR0eMcB58xCFbgQ+zpnY6cDV0vJIdYVd+IUARr3aYVz6yErVRA6982K5kgEDzt7/uJs67F6
	RUxEhZAYksRrdUzGqwcExWVzbiOhYvlhfy8pAQWKdaq5nL5aZY2o5NSXK3w1mPuv3/YK2H1y+VY
	JOms5MuQybKQT3p4po79EpTpeTm1fvm8Qh0vwkF996knxjcbXvIc84xQNSvglbTQIuHBmxq6CmX
	dqmxF6jT/X5s67VH+K67QJn6laAqCy2YVUq1fPiRF9sS8rk7uWA6ZT2RgBjfoEg0NNVA+kn6F7g
	1ofRXfRPhP10CSo+DQTMiP3V0XM/ru9obC2cKarRf8v3H2G0Dt8EhYk4xyCrFDSw4xLHC4yPp
X-Received: by 2002:a05:620a:d89:b0:8cf:d3ca:535c with SMTP id af79cd13be357-904d3fa3d53mr249543785a.4.1778028643696;
        Tue, 05 May 2026 17:50:43 -0700 (PDT)
X-Received: by 2002:a05:620a:d89:b0:8cf:d3ca:535c with SMTP id af79cd13be357-904d3fa3d53mr249540385a.4.1778028643231;
        Tue, 05 May 2026 17:50:43 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:49:02 -0400
Subject: [PATCH v3 06/15] clk: qcom: rpmh: use clk_determine_rate_noop()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-clk-determine-rate-noop-v3-6-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1399; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ZuwtT1UEtxCzGN9LoNJtI0urdfnTEDmvH2lW5lXk/Fs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TfDcYMYy+WLK93ovp6M6Hom7uHiFXmnF8L9Q143bV
 6iwLOpFRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOpNWZkeG23tKv1QIdP3vcT
 IpP0rRRLv9odPLKJWVPNROCOhuq1Cwz/VN0n/d97I/j+CW3/z4ebSytqVFW/OAZmBzJpZsxfIKT
 OAAA=
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
 drivers/clk/qcom/clk-rpmh.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 339a6bbcdc4c..d19346509cb7 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -321,12 +321,6 @@ static int clk_rpmh_bcm_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-static int clk_rpmh_determine_rate(struct clk_hw *hw,
-				   struct clk_rate_request *req)
-{
-	return 0;
-}
-
 static unsigned long clk_rpmh_bcm_recalc_rate(struct clk_hw *hw,
 					unsigned long prate)
 {
@@ -339,7 +333,7 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 	.prepare	= clk_rpmh_bcm_prepare,
 	.unprepare	= clk_rpmh_bcm_unprepare,
 	.set_rate	= clk_rpmh_bcm_set_rate,
-	.determine_rate = clk_rpmh_determine_rate,
+	.determine_rate = clk_determine_rate_noop,
 	.recalc_rate	= clk_rpmh_bcm_recalc_rate,
 };
 

-- 
2.54.0

