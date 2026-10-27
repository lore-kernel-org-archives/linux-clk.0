Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124354;
	b=q+OBPQ2/JTs2B7Z4DwROm9XYcveDsyYi89DhezKBfAfd1bFKhaCnyYPOegqAho9vsN7B
	 LjA/99x1HNjf3idr50oZ/MBs8vdYXUsslT4jQM6Xj4VfX251rh9ArH4y5i96pMMerKOcD
	 na7oVV0qXVr/O0CDDL/VpSCoI/GsSTEdNdazUG1Y8bnbALSxHdiwxbndJG+kAyjPilUuA
	 FvpLEIAJ3R8AgZpK/w/xQJxeMph1pE/4kqrhrePcHPWLxS+XuwVE3HDkj5g43GHBKsU2M
	 OCoYWECkcKwxrkoTA8IZFT+USaagcfksMThNZGVufg1KFB87KvITPmKD6PlY60PjeDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=BiajcH2NlShTUuuWJNWODcIzRZvnB9nBz3BjPTp91sQ=;
	b=MgR+X/UL4Q3J4ZivlIEzxK41DMINR6ErXMYJAFypOUJg0mdq+RkBAChcudAVuDQ2Ab6o
	 tgxPtYfYO+QdaVpXYJPQq3AbZsnSN6or6ry13oUWGtAXeX2MhRjjGaNv/2WJbINQ6sgKp
	 jqDZXsGfc5EGyOz7AJMDTGkQvJOqxe2S0xy6g656FVHFEup4nzDcaZGkODlC2ecDfqxRW
	 MRXhzEOlL3kaIUKqQb98CF2s1rNOfQxq/+/nf+PL8K2d256Bj6R6aXSePhtBMGCb1DuK+
	 Gc9bisNy/L/05d+c5/VRIwe6EVBohNusRpBQBobGCfOj3Ng1YiLi9Okhxh/JcKiRrnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjC71WDp;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97446606A329
	for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 18:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97446606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjC71WDp
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a208d93758so1330055e9.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Oct 2026 11:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793124352; x=1793729152; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BiajcH2NlShTUuuWJNWODcIzRZvnB9nBz3BjPTp91sQ=;
        b=wjC71WDpudNxsBmkC+HUupPNM3w1LrCXLfkkBxxZfDsa0qhcrOKjoQ/YNIWqX12EfX
         NInLwkqvGLE3q8LxUWANF1xanKknrqeYDj1E+QWq1Jn8GQ3TUPPI9GW+XH+3iUs1US2d
         yhM3Ii/z+dLDQtgeOtYNozep7N/bFDSjpTAu5houmKUkFFeoRt75jg5uQsRKHA2Dgmnn
         KgKt6IRC2L2JIrSxGIx2VPeS2aYKNY+TNHh/UTTGeA1lB2mBh0zM22JHmtYMYnUh8h6q
         XCodVJ/7BzW0bi7B97fsjOo1NCVvNqgx7xD24BTrfFqbEIYNAS6mSaMsUARSoXqam2uc
         TxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124352; x=1793729152;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BiajcH2NlShTUuuWJNWODcIzRZvnB9nBz3BjPTp91sQ=;
        b=LihRusq+eqjCcbQc1rOlt8tF2NgNhOKd/tilrGzDe+ISU4Dz6x2hOOYih3DmMjQrGE
         /onD9feI82zsY8D88L4kOJF53AbuPbBIxJt+lk0ttnVoFaNf37/p9Yp8knsIffCz0fyc
         Ue5VXc7G21Sw9Fq/rIDZqDXr4T3FIA83B26lJtxPDtvUebQjxFtnmNr9d4wUcT6y11vA
         prBLY2F2eSPXhCZoCLRx9mjIln4n9qLp680N76jKXXXehc8ii7Rm6nHUdoOBSagSCMm3
         ROxhJZyKh+MkbqE8HJ/S5Gcx9FrMrpwRsyWdrVXWdecZQk0X1+WOYSOaHZwavm7v64kR
         5OUw==
X-Forwarded-Encrypted: i=1; AKwUvBzOIKw3+mm+8ydwfUjW3zzIXMVs8vVSitBkhdP3R0oP/j69ugNxmvCPQ4atBTaH2tfmzPG/AYIiqYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjJJPdwN36qYHOlksOCiyXYEelQJPPYKTFQFppeBZMsTCUBZ92
	nV5ZxNBuBkG3IFZ6KXftLHvKnkIqU1Pa/JfDRoeFpgc8xRWcwtDq8k0C
X-Gm-Gg: AYBFou35qnBcwRPV+J267LEb3pEuk+JVM4QxT9sl94PZFOpg7NEmfx8eUxGgjG4rO3U
	OCThDcfiEWNN6u7h013qsURMbmqQmkRU2zRoCxLFqxmT6VzCuaunJaUb1n+xHxxLfyDqEvEcNSA
	vMOiQIZQHww2wSS5xTFpWtnUXlROR6kxOx8EP9qpyt82cfb/iOsiLz9WoJxB/ov1BOiB0nEgIbk
	bGM0aQgnrqiYWwtY0AGH5cuiZm08Q8Etv96neVXPNZiyU0y5fWoDzcns2F8UsblbwO0q5PH16sa
	2aqwwCiDH84KB4Wy43ua15UxJ2I+NNbmnmgr3Pp8mePudYFa39q5SzMCvklhi5rtPntBIFs8IuA
	Ir0w//NEBh7q9RQqBrvKfbFr/nU80UZEvkpxvIm8BVhMi4Cb7Ssvuvq1rWI/VBA5cpW3sLTCqqb
	6oM5lMrmb5wFAAqmQhxyWR8RmvnuL9T9KESYT2FQl/+Az42Ildp+G04QVe28HtkquIhFlg7Y/Ci
	bpyqKK73gRMicjSwkXJdrnX8fvBfB7oC93StyhAJtrYKpSiKxcqCSJjmJazFgk7Pc2OCbgeZUM/
	2eX/lid0
X-Received: by 2002:a05:600c:8b41:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4a77d22c51amr93525755e9.2.1793124351725;
        Tue, 27 Oct 2026 11:05:51 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a92bd50b05sm8192805e9.12.2026.10.27.11.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:05:51 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 27 Oct 2026 19:05:43 +0100
Subject: [PATCH] clk: qcom: rcg2: validate frequency table entry in
 __clk_rcg2_shared_set_rate()
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-rcg2-avoid-null-ptr-deref-v1-1-43c21b54cfeb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsHMSvpKdJBcayEs1oog+nvSc
 QZmHkgkTAn64gGhixNvMUNVFjAtLs6E7DODVrqtlO5Qplmjuzb2GM91xf0Q9CQUUFnbmLpurHE
 Bcr9nyff/Hsb3/QC1uay7awAAAA==
X-Change-ID: 20261027-rcg2-avoid-null-ptr-deref-0885433584af
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Commit aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
removed validating of the frequency table entry pointer returned by the
qcom_find_freq() or the qcom_find_freq_floor() functions.

Since both functions can return NULL and the pointer is passed directly
to the __clk_rcg2_configure() function where it gets dereferenced
unconditionally, it could cause a panic.

Restore the sanity check removed by the mentioned commit in order to avoid
a possible NULL pointer dereference.

Compile tested only.

Fixes: aec8c0e28ce4 ("clk: qcom: rcg2: add clk_rcg2_shared_floor_ops")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/clk-rcg2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index d7914e59129f..260e90f53461 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1385,6 +1385,9 @@ static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
+	if (!f)
+		return -EINVAL;
+
 	/*
 	 * In case clock is disabled, update the M, N and D registers, cache
 	 * the CFG value in parked_cfg and don't hit the update bit of CMD

---
base-commit: 55981579b27b6541aeeab81c768f248dba0491ac
change-id: 20261027-rcg2-avoid-null-ptr-deref-0885433584af

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

