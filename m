Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74FE47799B
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254734; cv=none; b=SH21a0LeHKCGNlteK9Hj+h79PuGSJPkRYYWa6kkxXXUmYDE4L9bY399n0XF2NZGtCzN36k7y/brHxMZATsmFyTLFozH4nIaK1hoWl/0pa1ndgXZr+dI5iDNIUE8szTIe/zv4UyN50eawrAHQpT+69aTv3LmUbWoiDovY3eaaUVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254734; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G8bBkUuIRhPDTwYAHoYspijJ3+wtPTsvv7Sf9O5al2TVX9VeTNTQrvVuBjbcLtPqPDFSGQ3AVk3wwIMQ2JU5qtZT03S0F/7nNML5HbQsxf68+YeSNH38D71hMU1wGX73CGgpUX5Lsezj1/B8P3xM3qV359wnc9OPTZa/def1yPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwzNz5PP; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwzNz5PP"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1151899a12.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 02:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254732; x=1788859532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=IwzNz5PPwzPLXlAMypLxY1NVmk0y5G4bJvezWLOAhVsQB1MV/Bn6qqM7nKLIjYhUCN
         Ouupu8ZUsj9FSfFKYvbN7hNH8bB5TNwnCFdi/TBIfH7QPkhjDWTtYYzzGlYvGYSVIj/C
         BH2o9OfHFbax7ZbtHRsiasc8chIz8PSUJ4lHjpUI80dfLYkadf/3JM4sUjVjtgon+7OB
         nerDhWQw7NArLOGVHFn0hw/gb9uGGEggI1ppBLXFcaXTyp9zDT/0WavMy1AOKr3CczrG
         MrgWcrJ9LnKM9NXy/+lXnB7b7ZP4A8mS6jx3fuIhhOOHXjDBf2HnlspIgssjkWiAzr0W
         owww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254732; x=1788859532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=Z+UaacUj91cLaD/agFVzrdCkLh0bn1v2OTAruPVpalVP4BzXW01tFX2cs1dAX4FvOp
         YJDs+4mi4Wt1SrSn3rbfcQpIoJjTEvOvGJIadkDEzUdV5Y5mdkJAfIhn7k75HfiDbtMh
         Yu+X6oJfnplvYHy1by5tbxkP3IIcTgCDoA2LvOSSzIre9jaLe66jsFFZVuLd1l2IkFW9
         7s7Wk0M8iRaSITf/5KEh84NEDN/w2e+h2sJQdSe/oODWjQAAQ3WQ38yvVmouNpRLfLMl
         6gL7kT/Sgc0ecVrpaFCNt5GzER5WbU8IEc1BftDewGySd5WYwolcjMZuRNx9YjPRBPo5
         XnWg==
X-Forwarded-Encrypted: i=1; AKwUvBwdMZzUNBJreORQIEkedhRXZk46lwLa4JkrwekFoV/QUflv/n4IKwr0vaDe1DsuvrpIIDTZ1UTmg74=@vger.kernel.org
X-Gm-Message-State: AFuF++l2BhJguQ+ECObETSrfO+/FaJAw7DbSAVOXtSCilzmMKkbroRRE
	HvYavmBPU0+DZS39pfg0i5hWHl7hRNySDwQuoxBO43gEtvrSvmyhMOpt
X-Gm-Gg: AYBFou2B5ovR3fxamrUUwrfNIEwjoHOccOfLScpUbM+kvqaAFXtzisVzccyZYHd1OR2
	Ho7cQnczxYLE3J/940yVJPjGNQIxv1TBSomMeQeqMFM78TJ8uZXDc1wRnoGOvg7v/vKaANBW5UY
	CymdUIdlL0ZUU/gLvGmRMiw8mcOnG300+ALIsz2SDN1DLEvHlMuOfKCyXwQ/RY9N/op8mO3abn0
	9L9TDKlcKxofgFThdkLboKW+CmOmOHeH6d4A3DcWwqaSz/YhwBFGu/GgZPxe5BNMSGLdp+CEnro
	pSKLrolnUIxHN5rDi20LVMv6SZB55x4wcM/0x2Stvnau6AhbTnN7E6XKLKJVDW/tRL9XMwDjYgE
	k1dIJFw5UCuJWEe3c1sKWUgQyN6yG31b5jhzycAGPHHOgC9nka3vqVfbE6ACjKdD/+SfvpZbwt1
	qlY2f9V3Km8VOpbREpgQ/uznWiC3Dv4nhGdN6anXwdRmLDod1vIBJNpIfY2mD/XHHgHSXWbyJTr
	jnSuJVdnPM4O2vpOjWg0Jw=
X-Received: by 2002:a17:90b:4d86:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-3990f7693d9mr4117787a91.13.1788254732028;
        Tue, 01 Sep 2026 02:25:32 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:25:31 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue,  1 Sep 2026 09:24:37 +0000
Message-ID: <20260901092447.3028-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

