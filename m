Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A07F331EDF
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376266; cv=none; b=VT3DdLZ0aHLUpAYOTyKQoSetCdQ+zXA7Tx68Yd6L5XlfK6mfHoh7VY2VTD2iRArfrAGwls2lgLT2Qbvuez56kI4SAf9fMKK8mRXQ2FhGRir6ysebegN6hvK8tnyqHEScIRmDEMp6ES7FxHiSOiUMpwU+UeNMCb54XFRe62c4jZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376266; c=relaxed/simple;
	bh=BNG/Nt3+CmK9Hyh4BW3hQ4JifMYdLAzHQ5ZifotMSIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UihxeKg3lBArFL6igGJP/r2GlQtlN+mTTpC2peKAxYVfHY4P/p/pkf8cTmnaFZ0404gCTklqUDVpJU3AZKkQClYg6DSdcPb1W4wM+O7JFT779RBRrGg+L0OtIyM1M/MC4mN1Pp+tODNRnZETkFLXOVHW8jB1YH/bktmfhZDN3Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKieohUX; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKieohUX"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39677aed4d3so16569691fa.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782376264; x=1782981064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=dKieohUXji8Rah3b/iY23T96ZagvUmR8qSIBphW2WDpKEqyHmn2mcPNVBwG1IdKKIT
         3bRCs32MoORandJTVu95KfCzvgNCMia09vf/iJamoT5XGv6kBuWVse0i9+5u7BWP4S4j
         NDcC/f12SJROU1SYPf0sIekdT3Yuae8tLGdAey64tnEj1D4iHOTWeirin6dOt2glnmIp
         IMLU9gBN8T4kVFKBKYE3r29tOvr277RIT4bckWacQv0dmkBPn3gwUZIV3psPIddKzG9f
         fgMUYYGSaoheqRVdVAkTVfNEZYjMsRmaAH8ZngxVvV8XryC9TfBwUZzeR1gR1A4UwGlM
         TL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782376264; x=1782981064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=XrmphqOdCq1fcwtqLiP88HJH5aeQpOyrYdZRzrDod3Tot7i1aoMWUT+ZnsoyaI3lIk
         Z8hgNJT5HcHmm5lIcFELr2peCICmSArGrKbetbrhux2UDYZ9PfDydBV1/7dpmSV4irPm
         G2hu41ILm4VNR1DUBunKO3covY8qUvfae2AlxkYpdVkos7uX9r5nU5DlAaKR1ss6Eqw+
         53ReL/9ckWSho0XzL5gPuKnbkAmBY+tFW/sLfBpfYXomNt7uKNxaoQxz1jgNzgxZNkJJ
         vUBX5Ji7e10/M1O/hB1OOwC9KxDuf7k6Z6Qo3KvVm+qPR/iTLfKtmy2oNuyUjG6AQYcq
         VCmA==
X-Gm-Message-State: AOJu0Yy5KCglE47/ceNxUrX02QGngxf+ON4YSfNWdofgmYbrkwUC505q
	6mwgI+9KfYIMBknyKuuXGP3AUnMILIw0uvMZw6JYwDUeLgV0VRSvUR6U
X-Gm-Gg: AfdE7clQtarYkxRM2s9AsFfC20r8DTo4kX7qM0QO5A9XJToflji3Ez/AQ2Wx8RdKEQD
	zX4mjwqRmoXlNpVOAtod6av31rhmRCvMwVrWgw2BWQglqJVFkhjN74HjMQhI1MnOMs42pbnKiv8
	rC1vCNACF2k01UyXqcFMeTCo2igCi3hmtCYWaCUMHlC4vPO+Uzkm8VPqhg/3tkW8ZuUj4l23j8K
	/+h0NN6X1LL682bgVnTuKHr7RQwcc9PaEq7rE7NiAqzoFxt00nSbzAAZWHktVT+Bo7gVLRcqvJh
	sBr0YNv6JkVzZaJauAnuPSYbiPIyyz4wbFAfNAFicMFThfpeyd/+djrDd4sEU60t6PLoQIpgRmP
	vHUo/pprGq2s/9uFRRdfHAxpkCWU/Y0xmx9fn0UVi/1y9NH4DRPK/3fqKETTaJ4oRwEs8b19jcf
	zlo0TeS6ag+ZHk6fx8+A4dsNtcG/sWTKPjqg==
X-Received: by 2002:a2e:ad12:0:b0:396:954c:3536 with SMTP id 38308e7fff4ca-39acb937087mr3503671fa.28.1782376263385;
        Thu, 25 Jun 2026 01:31:03 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ad317dfc3sm620731fa.31.2026.06.25.01.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:31:02 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1 RESEND v2] clk: tegra: support 48MHz clock for pll_p_out1
Date: Thu, 25 Jun 2026 11:30:51 +0300
Message-ID: <20260625083052.65405-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported
by kernel and causes BUG() early on. Fix this by adding 48MHz
clock support for pll_p_out1 along with 48MHz support for pll_a,
main pll_p_out1 descendant.

---
Changes in v2:
- aligned with downstream 3.4 kernel for tegra114 logic
---

Dmitry Osipenko (1):
  clk: tegra: support 48MHz clock for pll_p_out1

 drivers/clk/tegra/clk-pll.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.51.0

