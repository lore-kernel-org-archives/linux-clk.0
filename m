Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171483;
	b=o4+rGSkHR81LIK/qJWRrxV1JEHgblWJRrjt8QFjOGcLVc+SqjmtHpp0MuO/v3Mbr46Zh
	 RcAZzN/XxWQOSRf3yEGxD/kqMTMu68NJWFFYf6ghZH99gfF5KzNsreIwpK2iTWWV5KW/n
	 4jV5TFSyXdyj+giWqPurrTsnieFLySg4KUb8on1p+6qfNZMEVD6BK6sqVxgxwDGkZ2Rny
	 cOzwg7a997kMLXlRUDzmnVrN01NNVbEzDKyJDKW5ng6lAHMgP/6ZJNOO0LnoWFoFQxLKu
	 iSKP+mFKHuwey1XuxAWbJluCpC1qwUTTzV0ZptJ2V+22c4+fnRtE74kOGZ4/xfZivWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=;
	b=nkYmJXgXNHlvNpTl048PnjUkvMxmI3GeYb3YGNipxBKOljbbvDSpHRCA3t6t6zjRoHEw
	 Eo1iIJ8NOsJ3AZLB2sreyRbgIxLyszLTMhj7LpT0G111P0DS/NIFFcdsDhjC24xwDoIff
	 h9fnMrjr03rJWzZClGakV0v1SQbF6pzYx8T2T9ajcAuZ1PMI+TJO1LPJz4A/VCN9JUA+O
	 jb3nrOMBDDLM286M/mmmUHdbE0Iab2Lzz+GD37bjcktQ9UIkx6ILMlV9/GvedNH+ZmsdF
	 PnGE0m0PdDQWV+9COy2Cd5C70606yIRvwbndDn5aeOTXvDHkmFAuAA0z07pwDPqdRFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="EeLHh3/K";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CE8oAfV5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E904606A33B
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E904606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EeLHh3/K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CE8oAfV5
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7esV21048775
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=; b=EeLHh3/KcCx/WaWm
	LDQmUDXJ7tCRpkZhlu+asror4GP80v49z6ML17TnNySbeuVcjdnCGlLzQXn+mNdW
	pJQZIGUL02VhoJj9hn+AlpItEXk6fMlLdFZLrrjUeOqfN2hwiWNE4LVNOj08N/qM
	QkZmgSjmbi0VETXDjnrtS2OaYXJsqT454CXy+tSI2yB/vGBScmlSQT6lewPN+u+V
	QeHbynTqqFmS4dcMQtTrjPLJyVLbDl4AoRwgvmqVjM4nYhusLQjmbJimeW6Lprew
	cdSkl7MDtPC6mlEGxTD0t7ru66RfReYEz8jpDI6xTyv/dSdabfy9BH15OEQT4I9i
	/QihWQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah30y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:44:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383f2d05c73so2302440eec.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795171481; x=1795776281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=;
        b=CE8oAfV58qYjjMqi9g4y/7flkeg8pDeDJMjFgWbtjXCrapAp5BsV3KK1VE3P5JhPlr
         qut+VH/IPsr9K+UMo1U5pn5xnRiW/vHhF4Ik9ox56LDe8c8g7KYQZ8QYhr9lxw6AQ+Bi
         VDmE3zyCV1K6r3toJezZ8hOGnekRbsJrD7cEvYdvHaCOQId3ilq/mAzV+Mu+7YAzw7QA
         QO4myF8X77jovf2jrNc+w1rmhBHUe22FBR9BqsNBl6IOHVIuuCCsWlt4vfClXW1bOESf
         v1AxQCFUAvHrVPjotnvA21M6Zco8C2V1rZpay6XjSjDL1PKR2jcOiSAUDEMOEwes5b0G
         O/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795171481; x=1795776281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIhslLrvmapJff2vQ65fW3Yt1P4sBxJFOE15A/lhjxM=;
        b=Z+GNa2+pon1qtcKi2HW0s0zVKj5JY7rENfflCzxJU4s+9VHMr9MwIeRJlaNxdJlbrk
         V01wZwiyLsdDCpGX7p23wHoxgZn2b+26kVQn7k6xyGmXX9q8xhNGzhvFiM5+QphvGU7f
         bOeQQixxG+snSosxIPKQA1Ph7EZAF3hRnpp//7X+IEyDloVuU0UhBAL/Rwxi3JwhUu4i
         8PVHAooe32KpL2a/a4tJ2fCBetPmhfOgIWNwAtUrGYW8C3wG2l12Y/3MIfSAjEuP3yIB
         95EIfuj6CleNLnK1WIspcg9UiDgCeafMUNzntXkuRwTtYDnqlIYZRWGNi6mF/0WEvGSX
         WIcw==
X-Forwarded-Encrypted: i=1; AL+hErGRFYdgwG0eWRnqTECLO3LdqAAbb1OrsyCt+ucagdnJoEngvA5iJ4LVbaHUD+EEbRcryXE7B6eVOSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k4Hv31YnwJ4g2XcolO88p6uwHf8g2/YEzJ0LEBht43GTV+SEr
	3/+pcORnHdtIIoZkxmdaCJky310wLYH3KpKSjv5n51UvunhDeGaHslRTjrXv4JcXQgLDetI/nhF
	W/+JVeSSc8CYmK7CT/2ikVDe1mEpA0YwCf36D6Rretcc0PPMEhHpZKPmhX/mrEzA=
X-Gm-Gg: AZFdTZfw8kA5BRJAQNWHaMSKXT51KbCp0VqLKwjZGvS65SFNA/ecrD2MeIEfWGx/Mlc
	7SAr7bB9+Yln5SvZ3PA9ys4H+7Kmumg7XMOqX4UPhm+oeBFaOYQmv1WpnGPlh1R1dMf341Y8b8R
	mN8YR0j7I3oiy2g3Jjq165etcFjMiIfs+lCrjX/az/YC6HtZrfuWIvh3803xcvaoxYuP55Ek1Xx
	JP6AcaiECHdS03YzA40FgonZBxbX/8pkZgxrlA6K5A8dq6VC+E8/6qbaKjgZM417u/nVlR+QMg/
	Uvfq9mHtOyWojqWHmcoASadTJ/YgkIji39qKpKVm6+fNkCKKlPGUGLIDq1iuntOgzfpHhXGsMco
	ATeUiUvsibGTSOOlOAzpWZHVZGDA8CbZDKFViMVetJ7Wqou0S7GV6eNEW/Ve97SbeJjK11h5k
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr2694723eec.8.1795171481176;
        Fri, 20 Nov 2026 02:44:41 -0800 (PST)
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr2694698eec.8.1795171480649;
        Fri, 20 Nov 2026 02:44:40 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm6097471eec.24.2026.11.20.02.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:44:40 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:14:20 +0530
Subject: [PATCH v3 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks
 for Nord
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
Message-Id: <20261120-gcc_i2c_tsc_support-v3-1-e631872e670b@oss.qualcomm.com>
References: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
In-Reply-To: <20261120-gcc_i2c_tsc_support-v3-0-e631872e670b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfXwIe6l8s/APYN
 bGMndnuc/brHb1cOChEWgGhj0Sw+KAlQHe1C/XKeznKVZ2eC7UVMf5iWv4Nnnxs5GYmEwDb/5yd
 DaUVsfYGBtxf2p6F6ncRa+813NRyjyNrU3hx43CWkDZ24v5l4bq/L6DaRumidgcLZGq5uwKKDkL
 26u/KcPoVUsxM8S1tclqaKbq0G53TbqSgbZsaE2EaExAuO1oLvRSt9qmR+ff0kXwCm3MbNaS/7K
 mfKNAfv2kReOnevA/uLtqq9btjGnGt8x2SvJF37q97kFMOJnAgFZBQFt1oldZhpmU2rrEferpYn
 k2B0tcVDJlIOFgeNVxVOhHULoZ2gndPtTE23xDRA7r9amAoXfWMrpHfD37WtdPRe/Wy1ncDV5LY
 Myh2sNJ4QXT0MkANg6XyCwOw4/Ax9yLsfHraK6CXisB5Wwp7xz0nrDtrS8cM6BLDb9FcxkB2MiP
 mxXVo00/5vc3+Mo+uoQ==
X-Proofpoint-ORIG-GUID: 9wysngADN_hK7Xjp2IbsKQHmXvjrCqAB
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002499 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 9wysngADN_hK7Xjp2IbsKQHmXvjrCqAB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MiBTYWx0ZWRfXy74WQ+YS46kV
 Ycyp+L/n6ZMISHsP9u826uukXDWYBsCGfWZE3oEoo84SWcZFpfewf1Q14Z/ImdVSCrfJy+E+87z
 fE8bGT5SEPtzlKEv8JpHH47eS0JPGQM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200042

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index de4539b999850294926854a45db2997043c74f2c..f8d6963f226f151d8cd49aba9ab98f9972f8cd64 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -86,6 +86,13 @@
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
 #define SE_GCC_EMAC0_CNOC_APB_CLK				77
 #define SE_GCC_EMAC1_CNOC_APB_CLK				78
+#define SE_GCC_I2C_SLAVE_AHB_CLK				79
+#define SE_GCC_I2C_SLAVE_XO_CLK					80
+#define SE_GCC_GPLL1						81
+#define SE_GCC_TSCSS_AHB_CLK					82
+#define SE_GCC_TSCSS_CLK_SRC					83
+#define SE_GCC_TSCSS_CNTR_CLK					84
+#define SE_GCC_TSCSS_ETU_CLK					85
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0
@@ -96,5 +103,7 @@
 #define SE_GCC_EMAC1_BCR					1
 #define SE_GCC_QUPV3_WRAPPER_0_BCR				2
 #define SE_GCC_QUPV3_WRAPPER_1_BCR				3
+#define SE_GCC_I2C_BCR						4
+#define SE_GCC_TSCSS_BCR					5
 
 #endif

-- 
2.34.1

