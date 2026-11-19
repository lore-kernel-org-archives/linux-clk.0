Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107874;
	b=4zYaUHTZdVyuKq3dyiTFpMGJB+g8NZhN4BWxxTrMjXC5x626EBJGP2O1k87Q1I8rQ4BE
	 A0F7w0QN7rIAEbwDf2/KkDtRRPIxjiMbLSu+ewlljLQshIX4i5LgXvP8Hqs7XP95UuO0J
	 XS05EgyWddKLTzzwNxeJAe/nrzwiCdCfanJh17Sv4NDON3y6WAMSucJxgvjV9H08nGnRw
	 TdoNsVioDUQxH0/+hZEcl5jpSspCRFDMZ1CEoszdB+jO1bkWyPsVeDD/EgIGSaRs1XBIC
	 9k01RPk2XWX3pLty1EE1JCM7xiyd1LbCslJoX5LyOr3bdgukAOwAKKUadUGHc3aL8MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
	b=ZbDFjBJcndTbvZdoK+chAiZ28+421R9qG+ODnjvKYrygVGS+NLEbP66WqYxgtUSQrN5h
	 5LAFP0PNJVCJhvYvZQwX2FVQe0EprIgZGyVpf9FIHPM3vmTa4NVLBEhourOK0LIG0Gi6Z
	 KWNLBTUhnBzMl/XLZ9gT0tg3Wa8Dp6L3k+EWGZiOFvZsq7MRMCe4YIr1ZKNizLpeBZbrj
	 45SFiz7kxeD8cUyVdAwHu0HGOEYyEcJWldoi7EsCjOr3KwTrPC4mW9FjrU/YvMSysD9gP
	 hP7pHshZQH3BTO5UIJKheBzRT8cfhvBjPJVX5/3aDaIgOF3xAQzwjxoXBdsF/NtdxTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bpNInUF9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqUkp7VU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B544A60A260F
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 17:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B544A60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bpNInUF9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eqUkp7VU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGrhFm1385587
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 17:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FtJT6ChM42qLf5cqURCzWY
	5hoKVKmr/U8sU1QWX4Dto=; b=bpNInUF9dvYGSsRD0rnk3iuaSPxO5q+lT6ZDNK
	6LJlOVydMfad4PxIN4iSe8Eed95wabyzMx8c1Ci4qjbjxdlj1fw+TV+AYzoNXyxQ
	l/pwBxbw5YBwIZ58E86lHre6ZCwpvhDzTwrOgsGsCgrLKx/HZd5lmVhhJAXXvi4Q
	xKsfUnfvZ2EKFtZOhW8s3FRl0EYnXpabToigEU7taHZsMDdcmKYTJmW+S3nW0PMd
	ItQFV5TCfy5UK9V8aAqIgs3qvBmy357R6mbv/9gdcjJprY+V7vUJYyOoK4++RxwK
	6FHi6QE7zTvb5XRfSgmveq7WwZJLL41zLVAnlyJLj9HIdiUg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x70a3q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 17:04:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b647bbf87aso17667b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107872; x=1795712672; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
        b=eqUkp7VUaQo1HiNR6OpoI14lUNQYzev4NrXzHutjjVsWU2GdCDxhTLBjkx4FQsmuuz
         nNuyl4PNWwjOehG4z/2onUTD/jO5DjidDfYMpEZFRejwvkg1H0tSVzyLMGi0MIBjrU0o
         ibiDBIwt9S+2rYiZAmCjzqUPwTVbdwNV+oJEy+f8mu+0gcBuYf9oVuD9AbOLt4CFj2z0
         PTDHr+Dca9p1Ca349nhIppwV0ikpF9ENBB0euaSFX61BeLlbEIfLzXKq1nURjA6wejYu
         0PACTigSR4vc5LD9PaYmag7F4CoVFeLYdUN94zZyr7gzfS2lpob0z9jPvJ6Bw5k+lSC/
         l1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107872; x=1795712672;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FtJT6ChM42qLf5cqURCzWY5hoKVKmr/U8sU1QWX4Dto=;
        b=hFPph57d2I6bQiFRQsCdxZFQ2pT+iTZ/oE8ibK2xSZ1jIBCnXVXOttAB06lZ+Ys4wC
         t0PWTXDThKnTPpt8fiT5Y59rDLlEnU2YJK90Ut2n2Lw74PEpgdhpn/x/f2gHghNwiRv1
         uNHPHaEDQSpRs/ljiGtbfp/vD6BaT07xBp8SgpWEBZf25ybFUNBp/W2VOVE4eFSw9nrU
         knb5+dW0IVhv3YcCXUbcVKelQy3JXGhSnBVJaS+dmCZMmUQdka8HGAlmWUhVc8N8b+qN
         DfboTRjSncTFV+sjBcaF93UOFU79DAWV/5Qsx32Z28BthwoVs8kWFD9BGnlHP6svHC0k
         dtow==
X-Forwarded-Encrypted: i=1; AL+hErH2IrlfpXKqxV+h4xgzssBpfXX+Ab7FGfaefwZutSOR6m8y+SEGvewXAZeRnJ5xTOxdMLwm1EqBoX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R5hVSG0+lBVFziCUZyAgzBIEh3Xa2FD/cVsh1P/DbrjPzlYOz
	ighVtExrNvDwKqeeNmTWSuDTtcRdy3Q2+4I3Vn7nYLkvl5u5VcuDTPHuYgweo/KIYaZZHpXgnVQ
	yAoCoHrP/q4PXrv+DRz38RXzkSW5NXChIvuwISjfWLesCPY6FUBnrj0WUshhxn34=
X-Gm-Gg: AYBFou0zxiaqYNLiaNO/SrEml7aqXCcWHubellQsC16z9Fnuj3rX3woGh+hDW0K6LqH
	jlsgpg31tTTMP9ba6qD9W21t4F6u4mypZv3OjX/1/YmFpZCnocccE4XpGszuzlK98W686x7/xca
	hC3KJP5v4Ia7PuebSDbh8WDUGCL6KOKgakjKLAGLYyIcddaGI/YM7qahPAE0fhWNc1355DYivHV
	3eBf43CQohnSIKMZTnc75X0MavEnBJ2OweZ7w/rH1kIrRAoUS/n9RiYRlOnJZAXyHD9olBRc97E
	Y0rL5X9HiQxVyGI4AforqEeXS1DzSmJsHkLEDb0gWC6j8s5vyNkAE8fGyPMPQh1xJ7jV6mWQDJV
	IXe33rA6Qmis9GsuB0hDIFcahbYzVYISM+k9Ytvr5b9n6vGmEc4IReeTTV9MQZwtq+sGheZQjOA
	==
X-Received: by 2002:a05:6a00:2ea2:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8c8792c30a5mr302112b3a.2.1795107871574;
        Thu, 19 Nov 2026 09:04:31 -0800 (PST)
X-Received: by 2002:a05:6a00:2ea2:b0:881:e266:c3c5 with SMTP id d2e1a72fcca58-8c8792c30a5mr302068b3a.2.1795107871112;
        Thu, 19 Nov 2026 09:04:31 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:30 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Thu, 19 Nov 2026 22:34:19 +0530
Message-Id: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABMs/2oC/32NUQqDMBBEryL73UiysUr75T2KSJqkulCNzaq0i
 Hdv6gH6M/AG5s0G7CN5hmu2QfQrMYUxAZ4ysL0ZOy/IJQaUWColK9FZ2xLadmbb8jJNIc6iLIz
 RZ3T6rhyk5RT9g96H9dYk7onnED/Hyap+7X/fqoQUhdZO4qVCV/k6MOevxTxtGIY8BTT7vn8Bo
 U7+6b0AAAA=
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
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
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: LC4OYQ6KfRhOQcUe2fn77mjIJ1THeTMz
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff2c20 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DIp336sofITyGauNNAMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX4e7OtjMM0z8/
 b1+sVROje58Ebidi/qourd9TpLsbjxKG04gJ79mXhqXpForprP9akwsJTzNa3ZDlsD7Ljo+Z0hm
 cbD7kKMzU12Njde+0irUzSoKTokQg5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX0KiFfLUCn0M4
 BWPztXGTqylZb8xMSjlDTntO+jtyjz27fD3KQ0mzeFkA24V40Y0EWy+51AtSgtXNrAWHtlu06Y8
 Lct7HrDzKqjMudFK1iS1/Dxe2c4FPQS5F4KRtLEvjthchGf8P8qetyy08pwYqPqGJzdYMNdlZ+0
 82zSF74OmqpWRpyP1tP9QY3zwvhTZTLNqdfFvjK4hvGB1D/cPKhsOFu7JhIrmgd/Gx+ixIwBMIV
 hJl/GDirdYPn9TV9Dj5wcA38vAS8EruCHesshBEh2M7A3n2Ce4ddPWEiE95KuiPC7WDbSp0KJcp
 ZRRV4C6aq3it1L7ql5+Ep4etwCueQ4eoWFct9Z4BD1vvzlk3e48enT1+1+tzA8Pwm8cjXIT7mFy
 D+YJfBeZTdpIHvqQUeQ6rZb93gWFzX4DGDcSiyw15I30yfq2tuJ8RO9xIEoKXpG8MbyCb7GQ5cC
 1pofN0iAiWt4WUCL/iA==
X-Proofpoint-GUID: LC4OYQ6KfRhOQcUe2fn77mjIJ1THeTMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190067

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Changes in v2:
- Drop the se_gcc_cnoc_i2c_slave_clk_src and se_gcc_i2c_slave_xo_clk_src
  RCGs; the se_gcc_i2c_slave_ahb_clk and se_gcc_i2c_slave_xo_clk branches
  are now leaf clocks with no RCG parent.
- Drop the corresponding SE_GCC_CNOC_I2C_SLAVE_CLK_SRC and
  SE_GCC_I2C_SLAVE_XO_CLK_SRC binding IDs and renumber the remaining IDs.
- Link to v1: https://lore.kernel.org/r/20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 135 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |   9 ++
 2 files changed, 144 insertions(+)
---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

