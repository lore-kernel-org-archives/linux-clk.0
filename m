Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5D635FF5B
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687502; cv=none; b=P9sofPNy5brxLTRegr8Xgve+uYLmuZpFp70jMzxgZSoqioXfSiP00hZ3OmQ+gRXw49SUqnk676FuUNgWP/0vOxzqMS05oiGfsJWWdiP8gMT31flcihRh4Xvpo6xYSPrn+gludti2aDcXDumMZg7DfZAueLceE/IymyLFTRIPyq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687502; c=relaxed/simple;
	bh=GnMIYOAv5bcidbrdOSI/mw0f8NCnfV6cgw/8U95/Gac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyf/xC2+/LwOkhiTnpSKlIZzx4XSdOZm4ZzlkcxN/BWwTXup53BhZsSgs/y5eOCfzEdD2MeGXpScn4yJk5PEERB+dQKl38YjvFU0UKw/HWVXJEIw2VKDUcnONfobDxKFqCC2T2S5EX6vM9wvUUsK+pP+N1K2Y1X0zIFt6rdZIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sl2vyp7T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fh7WJmDO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sl2vyp7T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fh7WJmDO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1Cmde3403145
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7FEcFIJurSvYfNtxXfVXViev
	9lJcWS1x0OmvLn44weo=; b=Sl2vyp7T23HEZOna7bQEH6A4VugHU07O7RbnTL+/
	c+yAgGOie78VCdoiXLBFtHQCeTtmKhk08WPKDGUd3tshicprBN25tOHujUeKc8Qw
	Zygdv+0D4I/PCTvzvCVt/QUM86uAVr9NRyrrHnsS7S4GQbBgHuTFdLBLeEY67Rga
	jg3I8qD5AdNahb918V7OaNHu5Z2n29cYck6IVaolht2VOdyPFhscW4PmoBCboqnF
	WXcj8RBA2K+lTMJFBBCKWms0RDtdxVWlyKz0brvPu75IVUkyQtXMcEgr0VPPeXxm
	CP87UAKvBMEhWM2E8WbeupMd+O3vgc7+ntjdDrgnXYUoUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a9rqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 22 Jul 2026 02:31:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so235853285ad.1
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 19:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784687498; x=1785292298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7FEcFIJurSvYfNtxXfVXViev9lJcWS1x0OmvLn44weo=;
        b=fh7WJmDO2Sy4TTmveIHrQB7YxpIhSCOSjOkJE2TaTUNbZvzbnVJhwDtkETVOj60B+j
         nQuKf1WuOQRgUZSjAX4Uo80XB4luyt+J1XnvdDp1k72IMz7Zkk+UWPpPk9diQbtKsHYI
         ZbDA0Yf8CNvwPFuVX3q3c16/tAW4itOFPsuMGIctkwMGxV7pliRjvNw6wjvgqD0FHnqG
         mtssg11d1ZBgJ4M6tyjc6AXiG/t7DezBXD69LI8RC1a+NKYv55kfyhTiYOxRf7Mom8BJ
         iGRYvNpks6MU1eJHFUVbswwiHa2OfyF03Lnq5Ae6M8p9IfXVJKBJLOR2ku0z2eGzJzU0
         g7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784687498; x=1785292298;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FEcFIJurSvYfNtxXfVXViev9lJcWS1x0OmvLn44weo=;
        b=sWGVzkkkmDmvtT1O21imiSic1o4Pq+EZbALqfv0Kh7raYGLIOvxXdR3XNnjBtIkPpy
         NIU790xOAdftYoTGK0ytG449O6/umpCAGcJROUF8cNhxxCcy6LQoZhJUIZlVuI+tW+q0
         1s80Xzt6I4i3VTCADpDhb6PToRCD0eeMSvYOWYbcQGQhFmEWJ7vQi9CJx2H2aAa+Yphl
         VXvB+3vF5/MPj4XL12Od8cyigfBZSL58BxlahF+SOwUxhyiawrJbZyqh/UbCn8eOfWft
         wvbESdUbSsUXYz43D4K9p0JNC+EMy1l9Xl1p+5S4a/k2miToD0k7pK1mfoWhrRgDicdK
         ib2w==
X-Forwarded-Encrypted: i=1; AHgh+RpFuynfLUn+RkYWlC3zTCR3UpBjrw6gAvQ0OJWbCODWONEaDMR61HKwv0AellNqj1U5g+rsx+GL0Hw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk1VikjsKTMWjyeDE9cBVkfmNE2qqydVtwkSQkOQZAH+Mn6EbG
	OT2EXw6iQg/WvNyv3RRnCu9uziXplSt2og7831r74a1OCCX9w/WnYqt1AvUVxLjYV2becMU4EMP
	clbUYBiTYJgonAai3Ki787eXfATHBUoj4dDvxTj602edNRWAotZKd25q70N2BpQM=
X-Gm-Gg: AR+sD12oYrle8mYeSd4oUUIwvh1PXrNrvzq+cK1e1pNPs8KJB/RzAs92yRCy/i87V83
	b1afZyJR17WlsXiex5ry2/c4I37Ki3yTg+wSBNadaHclIcWog4mGQ0DltJcofP8fT6NN0QGFM5m
	2okH23+NqCWdXRaisUFWHiNjePMdmd12LfeOriRJEWFX3WOfKrTb3w+R2wMr+d5VSx2MU6291vP
	ky138UvHy5KIO3GqfAeJzCJbGOc3u1q43MSNXIztJB7ZfSEoY7OdHPRVn0x5MsXl8NS+TeG0Zem
	VXIRKM1JFOFH0YD+0I2W1M++dDsOLrEjQyWiibJv47EpsNm3Y/n2PvScTiAaGGFU664la8W2RRV
	BnGpXC5nA5vmBvtiPVXGOEF7VMlBnkx1reetGzSJdawE=
X-Received: by 2002:a05:6a20:4303:b0:3c3:92aa:4302 with SMTP id adf61e73a8af0-3c3adab4e3bmr22646316637.70.1784687498431;
        Tue, 21 Jul 2026 19:31:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:4303:b0:3c3:92aa:4302 with SMTP id adf61e73a8af0-3c3adab4e3bmr22646254637.70.1784687497959;
        Tue, 21 Jul 2026 19:31:37 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1e3d9sm3005785eec.5.2026.07.21.19.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 19:31:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:31:30 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/6] clk: qcom: Add Nord display clock controller
 support
Message-ID: <amArgrnqx2cCuZQw@QCOM-aGQu4IUr3Y>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-4-17e5a445a512@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-nords_mm_v1-v2-4-17e5a445a512@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAyMSBTYWx0ZWRfX/7xC5HUlcMAY
 nxxeZXwvo6GWLUPz8+l3icu+wImt+GUorVbK2dL8hbyIV23CB8cCkTho0z8I8HyGjJezkN3jUZC
 U2XBXbfgAlJDZoJh3Uu+SVz92YF0Nrahayl29IQiUESH4b0NgFQRw9/S8DdrCGVrsEzOUoawT+8
 xDKJLuBTs7xCD4RO2cezjB9Tf72Pw+pWQNeC55aBlxH1cuy5+WF9YVl4f+HK+b9VdtPXXli5pMV
 DoK3tBWpdB/Z8vldIN2KSZ4bCJfIFEynvrIVQgJ0ZdsVJoTaiYhF1Y4w/xbiUyU7lN3PwVt18Ns
 GgjNh7CjhbfjXXNRvvXJ6MRVDP+JZ1v5s3oL3oVuOj7+dDq9LToCZH2FIVXJwRR+7K6AmQ1RnjZ
 zQHLS4K4hQa4KqWOngWucppE0uA4H5OTKwZP4yWwv5iqYHsql/oM0E9drTRmFQfNknS2Y0+b0Wm
 Xe61r76C5ihrKQo4OVw==
X-Proofpoint-GUID: JrdA9HVCotM2qb7weVp1m8Rx7LPiTL05
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAyMSBTYWx0ZWRfX40iPuzxIQvRo
 weNWW4ukP255M288IsEzygH3suNQrKiPbHlHw5wKLW/82r9FnSbqkV8MSoMpQweeUhjdCYksNHd
 rt7OH8s3aTUDF4dsRzH/uViqQSOLbZU=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a602b8b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PSJN4lgLe9xo7xBllQAA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: JrdA9HVCotM2qb7weVp1m8Rx7LPiTL05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220021

On Tue, Jul 21, 2026 at 12:37:19PM +0530, Taniya Das wrote:
> Add support for the display clock controllers (DISPCC) on the
> Qualcomm Nord platform.
> 
> The platform includes two display clock controller instances,
> display0 and display1. Register support for both controllers.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
