Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6E1238D54
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800106; cv=none; b=h3cFoH5WLhmnRdp1QZKP6pA9dYFCQBlgY/eC/2Fq/+apInPQ4Kt9QZguEP9ZgLxV2nCykaj5UAWlmZSyvZc+nXgn6q/vaQKKqJ1cmMKNBOa2YQw1TRnCn+oKycHT3PEC1D9BcqZMPKRzgGrO5zmYx8zb9UJuySBwBZwaibzLdug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800106; c=relaxed/simple;
	bh=CnRPiuF81lBuCpoHlCurFFGdm2XmAncBNOM3KmceBW8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=POd8BY8flxFj5XV9YCy0EMYsu+kQpSScvkpvlSzHMJ+vsybHU0WA+tRf0lQ0QY8vpB6w7vF1j03RSYaO4zxPr3gQNvxGfWbWHxS0kNjY9KEhjKWBd9iSy0xMTya2WxYXVi2ge8q3+mIBC3QCsRMO/vSEItGBN9lTqPJTb79Vono=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RWptDCEj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PIjVC33b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RWptDCEj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PIjVC33b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsB0P2554447
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 12:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IFDcglAGXjSDv6I35QrERo
	oEJdRQga4AJsVg1Timyjs=; b=RWptDCEjFdY2iNxdRLynLUsGu0KCCmEb+yWGoR
	lchKghPw60HsX/xxY9w2EoXdxMz35ahruTp3oCYOUdO+bpGrZnxYoUE7SSWXLEEN
	130HvIhjU0SedSWWdBZ7ySAiu0nw+FEZbbaOXeym+t/4/zgaS7+rVWL4UfDgTKA0
	2SqXMPqtHWf9RNKzVryhiJaMeg3fWH2rW35S5wfP5zgZ2eP1CjVFSspyCia0rxnx
	iQxYmPanYNcjriKQbHAj7ts6S05GyWoiMU/+Yz/dP7L+wFWAFGe9G/7QjtBT1kAw
	j3kAqvSmoANN+ZF3WSHyG2yjzLWduMQAKne90jWncS2qJ4BQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3ssmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 12:55:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd5b20aaa6so111084445ad.2
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 05:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779800102; x=1780404902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFDcglAGXjSDv6I35QrERooEJdRQga4AJsVg1Timyjs=;
        b=PIjVC33b+N4eCY7jjH+S4Wo6rTMQOB014dz8RLFVxNvkXHM3N1PIsBiE7ADXRxA5HQ
         IUQMBEU5Wb4hB+DmtQW9AR2ItlbpYcTcsj07t4DK5OeLU+kaWJWs174sbD3elOVIE6L7
         L16HcNHp5Gyr9SXThswA1UI3JnItrQnrIXyW/199FDigLNTFLY8ox5NPXcNHWOTfehvD
         YUVf4HWfxITaQVmFK/6coVJAzrLPnCdP1nY/vQiHWvZaURWZehQDkbrVmJdndn/e3hZM
         c58Kpp/JIkRyO5E1EHfCeT232LZ/DBoVBQCiGFZ+TXiv041UTeIGAGQoLM5SAeMUxrh6
         v2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800102; x=1780404902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFDcglAGXjSDv6I35QrERooEJdRQga4AJsVg1Timyjs=;
        b=LNYMMFF6tuOi2qg6rCdpFYu2V+aA/m0zBCOxhw/MzPvHw0MrO2LaHth/E9LkIlyEIY
         tJgom09ThFJ8s5GZamz77sZL5I5TFauaA/gQzvxkHRgMPGNt0NlpK9pCgVKr/IRz7LMt
         ZfpU2tzEygUDiHh5y8971V/dqpAFqW8DClSHDgLzE/zUTbkDf/r+Y8dAhRyxKDW1UDuc
         ZKYxaWtNLrMdhOL7YMZzVvCbVBH2bv21jmrTat6aj0TjFD0MxSbRdk4G3ZqU4Wu+XaYa
         LConZI/dsYpXHRe6JsjkNGsMrlJR+sVKA6z63Xd125EBUKweeGi+eFnSf8dId4m3OcNV
         5woA==
X-Forwarded-Encrypted: i=1; AFNElJ8i4mWn+yk3MkLrPuqAWTal9LqWymjqtSe53T5a9BIERSXDkcwaWHbq6Vx3Z0Qd/hWqI+EOdWFHkNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCbNPgkdT2FMxtA3mV/FK/cZso/bA5Nw6YO4Q7AuBDxocBbPJ
	ZKaP0y21sfPVIpfM07CgFl+z7uC8NOlwN4Eo9pco7d9a4QLyep/48ek34kxkSF2qprx6iti2X15
	gw9ZJ+A8A3C+xWxNrdwJZ1EQHUuJIkch9W8CmI2nLqWp0N3fDYzUaf2Fkq6pjApc=
X-Gm-Gg: Acq92OH3UJq5XuVxGypAQcxc1z8mmh9aJNgJREhrM+9sYYVBU88c06cYq0apGozXpvV
	X6q9nLZNQXF1buWCJkpPde2UrJ+Vnww2ub1dHCAKpaKRrTYdQA3RF5CvSy5FlEp671pfqtcnbFe
	Bwcv63x7xzwwOH5q+3+wQBl90F5JSfvBcSXs31YnAmdcJU074j1IM+n34MiLmWVbfn5Ei4Oe4R7
	QYgvzw27Y7bwwgVZPktbpaku0J8XrM57CILpqGp+Mlk0+E2si+04vGIi7uA0hpmyKeLuN11nLk+
	A4KRCdJ+6hZoFDpMM4eX6JdqIjZQG1ummq6abtiew8cE9XswAMKIyc4Wq0tIuLdzIrx1SHAMqiB
	K0+6KpwLQksI6vie2nF52iRSI8clY/v5uZJDhkbXDmqKTO1vz2EYbIjMERMv+FcU=
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr195265515ad.11.1779800102319;
        Tue, 26 May 2026 05:55:02 -0700 (PDT)
X-Received: by 2002:a17:903:f8b:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2beb06c4f36mr195265155ad.11.1779800101871;
        Tue, 26 May 2026 05:55:01 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm129000165ad.71.2026.05.26.05.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:55:01 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-shikra: Add support for the USB3 DP PHY
 reset
Date: Tue, 26 May 2026 18:24:43 +0530
Message-Id: <20260526-shikra-gcc-usb-resets-v1-0-6d9e7fee2998@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOYFWoC/03MQQ7CIBCF4as0rCWZUqDSq5guYDpUotXKtMbEe
 HfRLnQzyT/J+56CKSdi0VVPkemeOF0vJepdJfDoLyPJNJQWCpQFo6zkYzplL0dEuXKQmZgWloO
 BGPfeYlM7UbZzppgeX/fQb53pthZ+2Z4/vau+tlbu387zVC6eTywVOE1DjLEJ0N3Vhw+eSeJ1m
 tLSVc612lmHtYam9uDawQZtAobWgw1Be2+UQQ2if73eVcTeivAAAAA=
X-Change-ID: 20260526-shikra-gcc-usb-resets-d50ff8a6c319
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMiBTYWx0ZWRfXyfCblyvZUaaV
 8NR3CzwW0r9LwBU4058Gihh7/n/8PjQO7yzWpMjOew2mfv6RfH9FjWTrES3BF8DBKzavSgpzQOf
 hyHJWZfW7+lruRRMiyNqsHqIHNlWmgnfTT9B0+ygCf7nRjXc7cn3VQbDGWoaK759NVOvv+uZUFA
 JX2qIOFTKVcm0ZRFg78vKCzPc3kPUWNSdOaOyEMB3n/CrJta3sJiEakJM6ZQEFJJEfdNnYVK74i
 07uFjWp9Sh5MuwYe0yt6m4CXIn0RG+qhpp1rXpKzDfmi+N2MhTb59zEOPEwcR4fqogj5IoSTdUE
 nCk6YPBRep6E+8z9HE186zVW2ApT1bKqD4YzPp/snCJdHUR+ipOMboBejEp7lxXEZPTM8IEFkEK
 +VB+7h7VkuPlaVJ7kBZs+mmmsu+9vzbz+Mg+57fEiaMOZUpD4jJY/yTiNJot31D0AKa9QCIoc1N
 iZZiG+vFJsEZ2F3hH+w==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a159827 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AmwuVZndQLEihibSxTgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: qwRNOlYakXWXsq7H9aizKQG_r11HUUDX
X-Proofpoint-GUID: qwRNOlYakXWXsq7H9aizKQG_r11HUUDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260112

Add bindings and driver support for GCC USB3 DP PHY reset on
Qualcomm Shikra SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (2):
      dt-bindings: clock: qcom: Add the definition for the USB3 DP PHY reset
      clk: qcom: gcc-shikra: Add support for the USB3 DP PHY reset

 drivers/clk/qcom/gcc-shikra.c               | 1 +
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 9974969c14031a097d6b45bcb7a06bb4aa525c40
change-id: 20260526-shikra-gcc-usb-resets-d50ff8a6c319
prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v2
prerequisite-patch-id: 5a0fbdd458785da2d0e850c851a05046672ecadf
prerequisite-patch-id: 1f98e515a52bbeb25e2a960a804afe16c6a472a1
prerequisite-patch-id: a64476b2ba6e0f2a55928baf72ec32672ee0123c
prerequisite-patch-id: d0c8651205232862b40f942929e1efdaa3084eb3

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

