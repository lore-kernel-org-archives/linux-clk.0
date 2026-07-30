Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B43750CF
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 15:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424314; cv=none; b=mI+Vz3dLMAPK3iQ6JPYjoMPqmwfBnEOIz0OUWit0InYj5j31A0ZbJU7R6zyCGNSWwk203TchZJVqqxa9kxHZbhlLykeGQQZtpfv9gcEvhpVaDv5i3hGYvKRaBDtFUzDoa8uAU19VbiyHm4zJetCXw1B6mpJZi744/KFd8vMwSCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424314; c=relaxed/simple;
	bh=RvcZVjuOsIC9Pl51wsUOC0pP2H+JVwoWnQa1/cpsOJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M0/arqLs1sRxQxO+PHXg52izo+/Idl4VAfJ7HJ3R2FxLIByYEqGtu9bDiqw5NdUcs3ZP5i4wbBpHBMxYZ1TD8Uf0kLBUwyfJsOIbw3WERXbOuxsurkaDpDYHol+hJ37CaA/j4Z+OoM/+69w/5gCI3aelEyLHvLKD8d0+E7vM0t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AtGHCuSi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ItModoXf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AtGHCuSi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ItModoXf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEiV8B986893
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 15:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=; b=AtGHCuSiYuVCSyDB
	NXsCgob1HGbcw+bTaX/ykigECm46dZJ4mqp1Mxw+2+2/qCVlHBWB0oQ/t8b/WV0k
	Y3oz4rphSriOLDUrhNf3HVx7+5GWQYVFvw/sQwNkbDcV5mrwl8b44lb2qZSY0oMb
	3jXpFGrhaeSmovs1iFKELE5mg2/0KILXGyTpSfxt3AI4gJD8SYMmNsIszYN4fYL6
	cvLRHfciHpiImZJU0F5gcQrko/Mc4CCH4sG4UD8UfKimHEZqvlgw7aZtoeD3Xzqz
	Irhyylth0rOs4qjViEghhNktRMQCpBxecwyTaF6lg83+QexFbT51WnuAUhvtm3pq
	KOyj7A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8n384sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 15:11:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5276aa86d00so24607061cf.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 08:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424311; x=1786029111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=;
        b=ItModoXf+PDJJcTtjzHIi7JOkJ8N6I+X8/iDh38UZh9z1KtaFu6aeuJpsXcbjTaEQO
         0orQc02hxVUYzotLsQCCdVR4osbNJFLwT+pWOWJAv9F9D3J5XLr33adhGfIe0PLmiwZM
         hx05pg8n5G8WRqOlzuRCMiqHztDGrltgPGcyMHxKO4ufUtqbd1StA3YQGngizCDdoijm
         uLmHus9e4VbDqygDSptVc8tmFKBag9bTrHIglbEbpjco4kYPIDGk7bdBcfjCODQT5+XB
         Xa87GIhkyuG5Cq8LBOPo6r9IM7zZvXhznSXPUlWNRFMNKfBqnDcZAfTbQXPX1McqOEPc
         DUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424311; x=1786029111;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkfwmLjM5aO+zDdmXWhNneZe4FLV66UTrWkSYHWlGa8=;
        b=ou9PWSgiq66ABv1Vrk8DgkDkwcWWpTu14Cm4jp+O7YFBmmuzIB77voEJbY2a4G3Sbc
         BM5DfS3xsG/US7z33dVI91OQSDQpXehKkgXQVKTrM5JDKCse1Ik9AWUm+KUqFmqYCwxl
         eVm9p7wVDp+JOss/vFBqHM8ADhHk8kqM2CyDzN3jwH0khHdbXBFvC3/tiJOdKSZIGKTu
         mj2c8N0sIfO2o3tPWzrytxNYhUiX9vpivbjD+ZuGhkTwtWmrENC+WjjqnpOrNVFbSX7T
         j3r9Gc49/4J2z370f09hWoTLYvuhlc050lgiWW9QOuP7l8qCisvgY7w3vu84YQjthhod
         zLng==
X-Forwarded-Encrypted: i=1; AHgh+RqqMy8jd9+XoWUPWZ8E1WIjv4RoxOFkyjUMAiHQVKhzLcnC8XMJFCJTgPyy8rOQA0ZCXON3iAb3yYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTjCKM2aSm/ztr8JBm8KzOiU9DqAD0RSKlE7tlkBCDAKeCmgb
	IN4PxOh7tfV/QqjLvJebu/mtIKl0sqF7e1eY0R9Swz1erU/wFNwEcloxJwrVWXlmRkkZzWFNXIn
	0wML5nSpKey2UZIcDvrT7fFBbJL0LYH3sKYGL+5YTWWXaP6t2XlF3AJPQg7Yf8C6Qya71Zz0=
X-Gm-Gg: AR+sD13Xka7PcFQ32VulI0lbmA9gdUzObG+Li1JGgzMnHE1xrBPHg7U3r3ld/jESElH
	SKGNwbDY0r5h9RupLh4qudwsh6BUj6AUNcMqXvcOLJ5/ayXfK/ZulMnwmTCxqBpIXg/PW8bRR/c
	b2RLOfEBTXB+o0zFsN8K/FUp8xiHcGLWEUHW7QvTti30VK2J4TL+qOtesKKjVEChtgUyU4hjilu
	nVUqn+FvoWx9qWgPlviSRp7ljl1/RQ66tfhGAohElg0AEdSCco81VBhKnydylF3YZIMNU7uo1fC
	0q8V3qXlynMFReoNR/Y9x6GkfLFTyMlGcZAW8p8nTwVbbynMmzt9hGzEZIR96PGrzC0Lh2N1muN
	v285iznhEHgOvkP3UGppyi24UhYM=
X-Received: by 2002:a05:622a:4b14:b0:528:3ae6:14d7 with SMTP id d75a77b69052e-52b38768f8bmr27763101cf.59.1785424310899;
        Thu, 30 Jul 2026 08:11:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4b14:b0:528:3ae6:14d7 with SMTP id d75a77b69052e-52b38768f8bmr27762461cf.59.1785424310154;
        Thu, 30 Jul 2026 08:11:50 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f19bb3sm64581405e9.4.2026.07.30.08.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:11:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
        sboyd@kernel.org, bmasney@redhat.com, Frank.Li@nxp.com,
        s.hauer@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: kernel@pengutronix.de, linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [RESEND v1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
Date: Thu, 30 Jul 2026 18:11:34 +0300
Message-ID: <178542193568.317194.17709997600643119798.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
References: <20260730085542.263025-1-hongxing.zhu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ar/eGu9P c=1 sm=1 tr=0 ts=6a6b69b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=J2BI-d2c5pDyFB2YWN0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: 0Ed3SasJFEFo1v0DLkpEiZss5w4bYymE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX6MJARkCYQgJr
 eSinpJMju+L8QFvW5SjsHwFf7pn4n+JzbM/yQCtQwZCo7elcTEdNfYTvvDVhmc9mrrrJ+Ur8e0w
 leH/YHgnTLf1zLxTf5fGlo1OhGZrF6UZY0ZDjTPtoROhIFOb0l0795iS0KPo+EmeWwvO/UXZJFO
 r+6jxXdBXXsoCc955voEKja3sVCvbvqlwD4hFtAs/U0gifYx+bQrrPtm3cXX4oTNvS8NfbWNH51
 kDY3p9/ivo+gbkGQjabmgh8z4PdN+gMwy8oeX0ZjgaX6Sy5g/uue49TWK/VCUjTfFlo1VYqv8uJ
 2k8cz2HMKM9cHJJ0IQy8GaXz1VBisK2FARgRzUQTKsoyfFQFLlI6D8NtbiLqFlZcSLXUH6cqjEv
 xUt1hJHUprrJ0TKb1lC/ofHi2NvhJYltitMC/+pji/5udpeKo/R2s4Xiv2mWUYpkI/bHHdf4wg1
 5pDkoo68dm9f51YiUsQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNSBTYWx0ZWRfX8XXAJea2ybrH
 iD06BMX0Blec1aUT8U4krZ5pP22Lg2MgJsbdPcyn1MACadcctrnwwVhVoXpT7C0mu9xEGub2Kid
 ZIsa7ex41MrFzXbTA5xNhXhyavc4+X0=
X-Proofpoint-ORIG-GUID: 0Ed3SasJFEFo1v0DLkpEiZss5w4bYymE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300115


On Thu, 30 Jul 2026 16:55:42 +0800, hongxing.zhu@oss.nxp.com wrote:
> Add a func_out_en clock for i.MX9x PCIe to serve as the parent gate clock
> of the CREF_EN (BIT6) gate clock. Both of these two gate clocks enable
> the output of the internal 100MHz differential reference clock.
> 
> When the internal PLL clock is used as the PCIe reference clock, both
> BIT6 (CREF_EN) and BIT2 (FUNC_OUTPUT_EN) control the PCIE_REF_OUT_CLK.
> 
> [...]

Applied, thanks!

[1/1] clk: imx95-blk-ctl: Add func_out_en clock for i.MX9x PCIe
      commit: 884dfb2dfe2cde33b8efe91ebf91542c88ca9034

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
