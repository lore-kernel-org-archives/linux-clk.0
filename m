Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114FD379EE6
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853091; cv=none; b=lqfYbjOPDhJje92LR1HRP3urdn0bTtZkbFfy/TO/2hyUFzij7IMXY+pDczLVAXch87LLYN1f0CUJgjIxgNiogfrAGYPVx2xH7tXQooGm2sBX42oVKxMtqpdqZzWMbLVo1PKGsMx9e91JYP3A4yZtohRx6jAsD2gHDLS724FR9Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853091; c=relaxed/simple;
	bh=iY6li1N8aOWymAjX+i7+r5/1IUwgJvmB/19fYvr8jWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLFJ3eQeMU/p1K599HKQ3MbSk22hDwqUpm8h2KvZsab956B6Yn/z/ikXywrN8kdxVZkZVZRk3jwHd4rH4RQxVQhkHWhGSQCukOXg5Biu9YxiUVFt4BrrMSyeGISzmMaEKGIOdhef3nv1ZAwTUtTlicTmk0N3YZj959vdgjQmkLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3AgYA0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hbd8h9zu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3AgYA0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hbd8h9zu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXd6A614581
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=; b=Y3AgYA0R+YWLTJHV
	Bq/ckoqpNGdWK2Ttu8lSuK+D7x2nGLU8JKFm/5jeiUrV2rC+YfDU4uJxRmjKaNVJ
	MbszMVA4hRAaycunghcsMHaLCY4MR+h2p6cVlNGQ03+uqFufDXOQILmU+7IRDpWK
	khH+YytFiUZEwBZFpniNS3VvPBCGjDDzUkyCZYaXZpuaCUcdUpqHo9oeqMZKZ8ib
	Rgj9DCHJTe04xo6cwkNxddZgGigGHePjlh9ihRa8ByQJgpTVgM3evALju8FdKczk
	ONfnXDlbU9fvA+kL99Fbc3873D4cG9dNloO34anG4L1wl02axUFC6xegIX/Agi16
	uc9gzw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr6987g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 17:51:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1d85c012dso233462a12.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 10:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853088; x=1788457888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=hbd8h9zu3Wasj7FUYAhf6DyQiWm3NAhnmGTM4i4BeR6LmsLbbSMmzvXC/eg0ow4/QO
         YfHGpbidXgfkVAWyUMamXOD3/ZtzuHKNqZnzycgUPOAFM/9j4X2hhlGPn56s++le49W4
         /kT2+zGctoBDrJh4sQ8EA1fhHp0Aqomj66rAKam3WHYRSy0FcSD8exVqHoBFC+oc9GXI
         8rMPViY4XGL2TIpn9x1QlJ/yrxF7e/bRxlKeZSAkKqwVal+7eqr+5kXrJsR0ggBNjwA+
         BF3CvrRWfOvVn9AwRwd/oGdwTMSjUeRs7Ja83P8lYfUobzy5R8SLEijyM2gmCHbY9osA
         jrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853088; x=1788457888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxfq3sde3/UWkYHQSyS+xk+eWHWNfmqXAOsgq3B6bQk=;
        b=rEJRx0EJnNyCdxgyPhHoKxE32XMI55SlwD1kLeUnwjIhgatvV4/geUO7BBLsymXpDR
         D8v+Gv041hy0ZcEEYk9umzyHotZpXDj+1aEYRNeXFEV5ZJrRlBP2+A5wiXpyMeXG8K25
         K+TqEyq0nnzAOCd2K2nx4UGW21OJCrmCNY5qjQBBn0P0JqCyftIWUD2dHdl5Wzge1yn0
         qBRMCGwV1xsX4jOrStDxZeZFau62plfdZTNo8GC4pzUOm+NUzCG6TcXSOUicQOgVAVLI
         gDQOFKEkbNIA1c6YShLZBHypsilDUuv7YasjASF/5O+l265lMQg4CkqXt4X71EGD64g6
         AzqA==
X-Forwarded-Encrypted: i=1; AHgh+RoSLzYmYsvy+hplYkiQPjHcNLZXAZD5HlkqFafEZH1EW5uIOd17byCujAsD5Xg5UkLQywbjL+sISNM=@vger.kernel.org
X-Gm-Message-State: AFuF++nPXbkGM0uV1Vgld5jczPwKxZ/BELn74ctDUq5rJxMOHS3tg4Dy
	yNFS3BQaqpooSTD6pnKVUQnr+17HH9h6Z2bg4edrTY+w8AODkXqUptDWxTxBBqs3cbJDLP6V7j9
	DVGJaTsLSizW04fu5e9uWBl0IwaNv3rPVQQCC7YNjGxYzmJogIEtae2fjbtzl+E8=
X-Gm-Gg: AR+sD10Fkd4CXfslnxz4ddumxTQU87Shco724kDYrPGIeuG6OsFl91R07O7bTjE/lAx
	T6TjbW9816BEoF/ilgBCvCPb2MfFpQy2INeDoRs/zYhyVyF/78831V19INJRijKK/hWJQ5mDhpN
	hoEidOmfRtcR2wNfUQRUl6E6I1XIgZvFt40TClD3YdOsh42zyJxrbTRLdE04eOpSc5Lo3Gf0nsn
	xnDY6x/F07jBiglGddhhSbHYR8SfjV8nLl/HQs/zyns29Gi2ShSqj10jLIiKjrb8JGZ/vJIRLHP
	pFbKweB5IBAvABIsa8JClM4vICMH+VaeSRAv8VaWOfwbokCvxXacAKOXRPk2hJpPIuUDRP2aWwz
	YAbwUJ3fFwGFcHsgdE0tgmc/KdHdEryZU2u5yCekfe/CX6xEAeiStu7s3FoAw0Lumjit0cuyls7
	HclQTP72KKNUgFT3g3rB5Q49c=
X-Received: by 2002:a05:6300:67c8:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3d269519f70mr1365592637.18.1787853087937;
        Thu, 27 Aug 2026 10:51:27 -0700 (PDT)
X-Received: by 2002:a05:6300:67c8:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3d269519f70mr1365493637.18.1787853087471;
        Thu, 27 Aug 2026 10:51:27 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:27 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:04 +0530
Subject: [PATCH v5 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-1-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=1026;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=iY6li1N8aOWymAjX+i7+r5/1IUwgJvmB/19fYvr8jWE=;
 b=aHAflXlP1yHXGFZJprnZ1WdCMs9h3s8lcsyK93pEvfx6jZpxExN02LtDY/m8J+rWWBNQyfJWV
 Z6kTXnWAb7XD0B7JqZJqGp21mffzM2wgOR4TI10aG/oBKL4c+4jXQ3D
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX/QnyGv83zYu1
 t7lEZ7QGRdbcR0Xc/wNuCAC/IjH5iBqt0k4eymhsTOhY9Hyv+m1nVKgkZZ+O5KmykoEvD5UxKZm
 Qa5YbArC6h9v9sJpoA2kiBW+yBswtF+AxACVSiVhIMQohnUUqJWO+bZkgJ6ax7fnXzcOha/Tgj1
 k2fiOzmkIv8Lo74GWKphbfEjFj5GOVWuARP9kiQ5PbzoDDpAouLijsqZbXMnOG4hYOF2U9xpib1
 z1o/9EOcj/+0cMmNnwRsq3qL7zcEv7zXT6gkZ+8pKO9nZcE+/4vUsI/kvJt+NKMFvsCA797AiUa
 x0u/KeZg2/2BM4tOl+WmY1AudEKnSTf3zd3P49c7ymiCmuhToFlIzUAQ/WJD6fRDvll8hAT7KQy
 odb+TJkVD3/OrflXVO2YDTF1A7pCzYQ9LS+sVQOFvTyE/dBGAbT5g68Lfzzvp5lpvkiaF5KLW6t
 GDdOR05qUNIcYZyO0Mw==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a907920 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=I-wlBW6BsxmxmlAWD-0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: UOJensd1GmPpnZBNoRU7Ev_rHMql1IyE
X-Proofpoint-ORIG-GUID: UOJensd1GmPpnZBNoRU7Ev_rHMql1IyE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX2WZfHkrGlMEo
 IEZcbGuV28Vizx+FSfFV+UMiK+t2LMT8f8fqetQCDSWZirzJkmGmgYIUyZJbmwUVmd7i1Xa8Ivw
 MaG75703KX1AqpZ+zWTgBCf+yFfYKJs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART. Drop the explicit ARM64 dependency so the
driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
COMPILE_TEST, so no replacement dependency is needed.

Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2b524154d9fb..9f703261d7ac 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0

