Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEA947ECFB
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390130; cv=none; b=Prm+YgClaziHnlIjI13EyxQCpXmhaU7J4hkrNYh91E0S43Bd/62pKhDXX2zI6XOGOLrD97DBIQAmiBrWZPO0fKRjjlY9pBwyWJPG+tSBe8ttnCPzq3KX7ylqYvc98AN2fPvtiv6g94YTsvNWQ2sUO0MNb3b8r+1+nEno4hfk+/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390130; c=relaxed/simple;
	bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6cmnJ3HB36mIy3EX5J6Xlrxw8p1iV6xzMckb7BvkgLmoUOn53/pu85UBnej86zRAWXrdd5bxYF1vYRDHdxveiqH8N2CY2CaNd9UEIwfljGIO1HSXmvgTRDFiKOch7tNMDlEHAj8oFNxef3SZDTLrIdwCc7Q2pBtBMn/YjrePJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4Cn96sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M55bXo4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4Cn96sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M55bXo4+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ECNUSK432082
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=; b=k4Cn96sblhboQuy5
	cMxuQlHWpeKIrddXA5BYdoxP7EiNIy/MWbzNxaz38GpbkcmW83cNcwLFRn0fGfLE
	VMG4TJvlXqn7mWaB6naIPRXxP7s2OS3hlx8cR2uThE7pdKhzV5TpjCrzxgd+1zqP
	R+5UE1XNjiWWqGfZFN0LgTA8uh4o7EJvrtg7mgoV7SFJ8Sb/lt6qn+QJi5cGdWMr
	zPKypvz5/Rg2rHnVe0LjOwr9PWbqjDlOX5IKDUr92b2uwE1S/M7o5/4pq1z4cu+Q
	zLAOEoINSB7oCzZGgAKlNzEAwZamoIeYNvCDZNoaelTl706YkeGgs03igpFdoD/U
	uUjozw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpgvtg2p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so499559385a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390125; x=1789994925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=M55bXo4+OPAw3QFHS73Pq0K6TQ36N1nfmZtiuNSz2IZNZWNJFRuSEmqADyf+knmIOZ
         rfJdvz2FbmZ3CIEPahTf1+aNuQAkC74qlEQz427IHDtynyNmOb0lEOzGAmCRfFLxMJbK
         mI3KiWBxCMpAeRSecvWXfTKClDqoFmVZDsVl3IgrlQuBBEJ51aMjui4aX8QxMSGsHUb7
         cgsY/tNGUm0RKSVteCyk2AyTtxnkEiFUPX9hJucb7YHoqD91nIJtLcHWR7+sq7leVACF
         mCvRfypF6Om7wWIJlkpsDfwGuSNe69FBYh5ooxoikkLpOV/pQifo0UulINO1UARzDNH4
         h41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390125; x=1789994925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ioTurFG44UpSK9/T/8OV/TN2zLy50fm/Nh4TZJVqzm4=;
        b=Pzjfy/RqU8CZAt3Xryf9izfzJ0IyIooFNHXpH+V7s6sbpicZiIdiFY3t+SA33rnM6p
         lDpwQ/Hhohg+GJGz3WrHOc1i0k1LAF3Xn5QG+lOpNpEoL7kmWrfZsfp4jRRk8Y4+mgC4
         UMpAdVPZKfxGwVLVxaSJsNx8E8NCFoHW3AR31vRkgcdc3UkkHNOHn7FWrErIvBbh2Ag5
         WCAtt0AJmU1+1mxaKCMAgSj4chet34SXOWVdWshDvsn2M5tPhBn3DSd47EImXaPQlgyV
         R0tdBYwxrXWPO0bjH44EiyhpU4/qENYPqgY116LGjDekv6VOsy7y1af46zH+JAz6YpWY
         Tjjg==
X-Forwarded-Encrypted: i=1; AKwUvBwpeo2MiVT9LyFE5NwIKlcKuzaFHDUoXOCz2HzRA6wjJUB1O+hxRQm8sOZJETmKWPh9afrkKg0++VQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nKdnI55DQpwa69n/VqT6E0ynkC+EGTipm+nWHEFKCT4GQ6DvSD
	6L7eyPEhqjA768P2BnJOzv86leXwoSHDm4+2wf48oSgRxPC8w+EXMslzC4u8Bb0PkZk/x9tRwyy
	2zzopR3iCYLJMsr/0cqM6aBpPf7nFPbpp7j2LCSk1ErJTfhsoUjojHWVqHE+RGkrjv2be9vQ=
X-Gm-Gg: AYBFou0G3PKoWMsL8uMN0j9Xi/oAYBYuZdNfn6pm+ivWyloocHR5PbSutQNj/glCWYh
	HPPRB/HUnxnAt7/RlZIQiTsnNMcf89yOgkqpGKW1iW1cgJZtQ/Yqvj9T674CjeMP8rCXgszDijK
	wMUNhHSHACdQ6tWPPVhdU3LDBIES6bCEvP3WbwJUBxbHtPfCdE4SGkMB8gGx96lC558orQtfI70
	+9pfZXk5JOLbi2aT3MR0zeN0PIx0pxm0BlkGG0COGU20NkjjV4Ts5s+IsaPfVwqZ635JSZhQaIe
	+6YOP6+L+qqF/7Dvc5ZAZgrIGwMtB+fzS43hXkrFUzjXIVY5gbvTxBrSfyW7ErH4xkslGy0tZr4
	fEwshE5KB
X-Received: by 2002:a05:620a:43a2:b0:939:b482:d474 with SMTP id af79cd13be357-93a29a027b9mr343042085a.35.1789390125400;
        Mon, 14 Sep 2026 05:48:45 -0700 (PDT)
X-Received: by 2002:a05:620a:43a2:b0:939:b482:d474 with SMTP id af79cd13be357-93a29a027b9mr343032485a.35.1789390124706;
        Mon, 14 Sep 2026 05:48:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:15 +0300
Subject: [PATCH v4 16/52] clk: qcom: gcc-kaanapali: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-16-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qmIS9UURXAzWteJMKNBj/WlZerpxHsDLMz9STcV4Hxk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zbcD0xKA/Ju9pSsxhdtvsRJtdpsvCuXdsnp
 nC7uuOrWxuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs2wAKCRAbX0TJAJUV
 Vpv/D/9X/wGaKFTwUH9gHBr7eIgfLBBvU/XMS0A0qyQRFGTYu1usAnL9hNgwgFGaZdwbH5MsOgz
 nD2vwenLgPfilxhv8UQL6ziJHLzbv1h/P9dnrzfZ6ZvQk59+mB7PJ8eFPLTf5Tuoqb5E7vzUkiI
 BlDRRwaEcRYA16eD8ZdBKMGg4hdPCL8nEqsv9f6Pr45LNOEyKvgY025lmXE4P9OePSIyVuJ1Y+L
 /cvcfbxXQZRWHCn5nsRVBF5EK+Y9chOxuajT+ilZ7vaArg7EQxFW3Ziy8DDDgg7WE52NWJNKxdN
 4va4oO4L5ZxU5MuHEvVOasJrqQgz9ZxjiiGdYCkaV6E4SdApIRSAfgCCqx2Ucx58M9vRfu+gp8J
 h+LDyhdAtPGlvQlKicjmoA+n+yFFGUMZno3K/SCS3Ed3eFn8ITbRr+JZtbLBYu3+YrddKVbDj8C
 R0WNwIIda/otgJyqIY6xz158DoMga7gZvijQtV6jj5tLSHRLqE7C/ky+O40nYATTH3qo0tnrQKz
 9UKk6/f3LeCkYQOUow807NzoqOr0q1eUVkt4ofv0qgRpgdt4vTJTOkJ3vhTeuyQjWMntyfUWFkH
 ONKLOG6eYfGh0zbib+sOFDQ6rN4vFnpiQRXXWQIixLsE+AXY2z+ruDI8HcycNJQ+RmBbxXYYeXp
 BDPNX7MqatqmoTg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=c/0+0h9l c=1 sm=1 tr=0 ts=6aa7ed2e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gcpHbPksm3HONcV3VD8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX6J4fiQcYuBYm
 8DQJv8azMBUH4NF4gwLPR5Aizg1UUDROTYpY8PDnpw+ix97HhmRaghF//jfJGv9a33snLO4yqCx
 8kkjp6IyejiWSqQgLVBs25pXxTC7Nq28ChGlNHIfDS0A697e8bvo2WTXwypt6oAgIrTmC7/hAsL
 OHrmk/eYx60CoTpnnefCiSzpgOEkOGvN+sG33a40sGn3G2uuswmMx8XLJANx7/U4BJadM6sKiFj
 8SDy7rVIgNeFA/30G1kCZG6jyAIHNLnL6dWVb+xUqNg84oKoVWQCSPXsCW3iJOAJQ0G5Ybt500b
 nkvwGBjswSiTsYYMkXT0vzwKVIQymlsxvX5nbqqsGeumAwk2Xm3hIbfPYPLLwvZfTIsOxeRI3AU
 fjZFTn94ayrVj3Wrhxw2jh2S68R5bN5+ata3V2SNUdWW4w9+bX6ddfojGibkGGJ2MaL+Q8LksiO
 A8rEkP6sxO6JnIbwh2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX/tao/r5wZ6Yp
 0LpAdGjeG+RdXSjtsrn7dqGxoeuPyXr7yOiIPeuQa4XLqH/VZ/qNsWRhphQvMCtZUVmRNQb32Bl
 NxulSqznkyG7SzujnZcut07ynO0YUk8=
X-Proofpoint-ORIG-GUID: VEs9d7Q3mGAdipo18HSFJfxcnHHv5oGF
X-Proofpoint-GUID: VEs9d7Q3mGAdipo18HSFJfxcnHHv5oGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 5bcbcd178657..c40d2da1086a 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3502,6 +3502,7 @@ static const struct qcom_cc_desc gcc_kaanapali_desc = {
 	.num_resets = ARRAY_SIZE(gcc_kaanapali_resets),
 	.gdscs = gcc_kaanapali_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_kaanapali_gdscs),
+	.use_rpm = true,
 	.driver_data = &gcc_kaanapali_driver_data,
 };
 

-- 
2.54.0

