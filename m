Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303605;
	b=vFsIba/0Osf6g6463j8XGtFRkC2H24CAEtzLbFRcuj5k79ZAkSOG3n1r1+17y6o20Pwb
	 RfATdF9JoJKjnGayf3rt/3EyyYLmR2n4JvjfuXKZJ6zl/noB3RbrZ7ww/DP6DnynvoxPz
	 ghOxZMkHVEzRSPbNT73QEslUs9pMcRDflnRs+tTyuGLOdRDt98aTCtN9u0BrIEAsBGTPx
	 WBbLdwYzR6CueaudSY652q17jQvRUlVt316/hgHtSku2VUSF4twZJIzyMdaSCGP8ItcxC
	 U0+2BG/tQ+c4Li9/r3dZa73S67q0f9NSxLBGpFtIVCM+ebDY/hjNYSDVM2w1cAhYt5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303605;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y7bkcxYY1gBkDRHqiDcxBJm6m3c0cx4HJ2rva7mAxEY=;
	b=EatnresgTjhzgAN/xEd6xXOhPzAbwe6cxSYGmNw7InGyoFs23k2xCRVYjQaJYcRQup80
	 GY6yKahMZKQ8ot1imO4F/jyMy9aBcym/IvnRgYm/BnoxPxJzr8Iw5yn/Zpa5U70K67Jsf
	 37w//a423UxrUYe5pJt7M0DSBVnTIcLotsF5ZABtgLT8xfyME71E2zQDatnR8K4IU9aht
	 BrKtX0Gg6OBlKLtQgls6JqAA7ifVuxHrQLB4g0dObgRDkO9CuNpgVNW71+dqRIbgu32j9
	 siJ0GuqMUoMUZjpWKRx/kK/BiJJ1+tejqln11w4aOuMUtLL+g/2Fqb3NNjSdfAURj1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n34dV9sR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReGzUHgr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B8D606B2C9
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 09:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61B8D606B2C9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n34dV9sR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReGzUHgr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l8VG3392427
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 09:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y7bkcxYY1gBkDRHqiDcxBJm6
	m3c0cx4HJ2rva7mAxEY=; b=n34dV9sR7yaBOmNYnZyPb+PNUxzdVHxYNu1sctjY
	DkiQR+rFEmIQZ+y2vsNnX6hca7rAODfb+cQWCkZrqe6CzMVfYNzzDKeCUvYo5oO+
	nhs2JX4ITljFgx+tICJo0N1hVxnToYHfluOQW26Qe/RnV3IGxlYeqmXPoxeJa0e0
	yi/3ypalME67O09T4E7LGupXYf/fs3OrJLHNZ4ewTtFH8XJiqCy0IqjKeDvARjDX
	4feCch7Yg5KeevMTrKndc2YGHrvJijlv42Fg0Zkk2qTqA6tkfWQQcaGTeSHBY+uS
	xsOLtm0BSostCSKR18yA0L1lXC92oxYwS42I6cidzrwd7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg2ukd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 09:40:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so359089685a.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Nov 2026 01:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303603; x=1794908403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7bkcxYY1gBkDRHqiDcxBJm6m3c0cx4HJ2rva7mAxEY=;
        b=ReGzUHgrxME9i9wcJVPO5Q0+84npa6rab8GGs5HmICjAtbGsRUHRU+Sh0WiTJowE6V
         RhO+TdMI2EZZD7X0/ODblp3+gsBk02W9ec5O3KgRvIXBYA8PE9DhpIxHPWzivDH0fpwd
         Dq2v833Jsi8yCOcKOCyMDZUs8qf+v6eQIEuKxmwV2LNhBfiUdLe8UrzPaFTlLX5+vAx6
         VO+qMI3GkFSYwo24jlivK10MH0c+OwzCqG7gAO1FtHVPtTXhniv2JKczOhXnowqiZB6U
         E9P8+m4HGBtK3+zatlzrEOuHl4v/FjhD/Kt2dsrSQwbe8mMDkk923hfi2yQ2D9VTSUfC
         lFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303603; x=1794908403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7bkcxYY1gBkDRHqiDcxBJm6m3c0cx4HJ2rva7mAxEY=;
        b=u6gTQjF9WkFAEklXrHp77Hva5//oBdyedcFTKeyOAlA8aEDzz/qkCMk/zvw4uUHgbM
         8gMe5Vno66ttC/2syuFJDLNAYFixujCq2GxYeQ+x0ytfa6XiVzPR/6EKQ2fZ3OYrPlfX
         dQdxUQdP+wn0qu/Hllje4YYUpKUl8qCicUYuNt+3SurXbPNyx3udk5W4mjMJQHK761nJ
         SE4c8MfytSDMlGAgbhSf2IzdLjoxN/EG8qrlkrWCTLzVLWdz1WHtUkbMh1awXJLHre+n
         8d7tlZulFDbNAgrfYiD8kgwCD+FsGARvNSKcNbNUvMflemryhQOIISjz0afExkTfoudX
         N+pQ==
X-Forwarded-Encrypted: i=1; AL+hErH6NAo0ybWOIRnHaQnu0xo6K86WwG0ynEaCxkmR+dMFQN6ri1gO/X2Zgq64bYOfInRrAzP2E61FBhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Xgms0TNn6ZL45VpophaswJ1lpElsjljwvGCBiDzpM/DnqKMe5
	J6BqbAkD9CuB/WZiw1RFSByZQxWvgxpkXoip7FKhWrkttBXljpU5okD0Kj5hFIAd3Uvy1Mh1Equ
	9Q2CB173C1nT9gsE7gl7maMZ+POasRrceHDhNvNnG7+6azw6jSxRZXaJA5VpVMQc=
X-Gm-Gg: AYBFou1xlXLskipeGogeGEtm5bTqFo4r2zbixOwyWxCXEHn932Y8OCID9QbPKF3oUZe
	TuJPLvt4c68DDpfQbFV5LqEkgyqSepK2bG7yZ3yMvZRi3+CKleve76THTG/Nxetz3hoN5sow2rp
	jzG9FyRnnjd+NMv5nVaAJCa6nvii3lpPJX7pYBD0Ad1+Cma2s6cLXLaxCX4vJ5oMwvaDwWJBTLZ
	hfUKRqlpHtixqatVfyRzyPQM5XYXgmetsYIBqul2fmuyD4sKP6BTCtIZ9LMUUUCV3ve+e/kPBmu
	cK8CcTaqJ5dYoWnOTESNOOJpXfZ8oaadgmgnIU2qLxrMTxkp5VBsqIGhxS+6VAcVqrcrHm7ITm/
	YqCqTvG9nvlg7HHYgX71h6IA3zfOMJpotRJJEw5IBWiPOTPjGAeIUuT5Zrq4gapdH
X-Received: by 2002:a05:620a:1792:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-9479f4084c1mr331191385a.68.1794303603360;
        Tue, 10 Nov 2026 01:40:03 -0800 (PST)
X-Received: by 2002:a05:620a:1792:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-9479f4084c1mr331187785a.68.1794303602432;
        Tue, 10 Nov 2026 01:40:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5b9sm3991165f8f.9.2026.11.10.01.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:40:01 -0800 (PST)
Date: Tue, 10 Nov 2026 11:40:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Add SM8350 camera clock controller
 driver
Message-ID: <xypphmxc7hgjfp6ci76lwjkeu6u65vzzniehwujfa2ticldvkd@outkepympoli>
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-4-vz@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107173621.3538964-4-vz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfXxxeRMsHGVZJs
 XUIVv99d/OvQFl+EOjshn0DfaKCIgO4iPa2j362idBf+EAJOSKG7IPMjvn4oboYQxDjferMYpDO
 2oqyn2auv7BTeQx/YmLC2vJUzG0y+Y5423F4ER7UOfq478UElfSkHrixU3wECbDzWxJt5rnMCzP
 hnWnWIG5h/kaI4ISCdAGOlkk03gl0pDVRE6Tci1NZ5FOBeTmABTWFdE7+GvDDzt0+iUM2Tv/Sjt
 KiYc/ZsFXJnXPvl/MBam2Ze+wAZ2hK64chbbJjkQujHHyr5zH8SrZtmLZesGVShVL1yFEGeoZJo
 9mWPG5Y8N5iP2ibCnYdTs/a+mduJtrWaWJhq4cnVhaCqLOpdnOkt4OMDHW7mpAsgGu92/RkE09f
 d7GiHzwoh6TKEjV7i52YZjMVtPtckDattftuU9vTowTDGq0cPFGTdjFovxhJI0ybY2ad38QNsts
 73ho1N8Xbvy8ecCsf5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfXwefxP1zRi3KM
 ZKBWbfLKLabHFNpyItvk8BbtD1hdIH6RoPy1S9d1uH4fJRHFh0VCS+OocPo5yaaxP1NsISVEb68
 msLSslYwgOuNAasFQ5CAKGHdu4vBon8=
X-Proofpoint-GUID: _C-pFtrqoJUS9gKrac33XVlvrwBkAVUe
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2e674 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M3dMwcLLegYjQ9TkI8IA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _C-pFtrqoJUS9gKrac33XVlvrwBkAVUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100038

On 26-11-07 19:36:20, Vladimir Zapolskiy wrote:
> Add a driver for the camera clock controller on Qualcomm SM8350 SoC.
> 
> The clock controller has six Lucid 5LPE PLLs and one Zonda 5LPE PLL,
> clock and GDSC data is taken from the downstream Qualcomm msm-5.4
> kernel.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
