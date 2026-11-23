Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795461644;
	b=iUIXwLhqFgG7vJy1el+nTm5Zroc6QW83yIhbgmJRsCMlm0u6jWnCUabW3GWCYxrO3LYn
	 Va2yLiEUqFhl5lPAAR7WBJXGI7KqUffz3N3Ifu68KOYgsqHcU1DhccUNBcme/WIz0f1kX
	 Z3/5PpftGHQIcfRsN6VeofLWzzV/OAORP1qGosHU9sC8VgQDfUHN2BzbasMFYrSpu54YA
	 WMTwt2tVrINLmPcWRhzMFQtTH7hit1zxjvhN/gPJX3pB5iHRI5ICIIVq1JT99omYPo3VN
	 kKNYKklAcdjx3lJL+oxuxjr9IO3vBW6gRNnspSBNPGIvkn837xocx95jthEJgWQOUlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RSUXyNbT/2UaKGkug9zQg3mlIMfpMREk/hGZ/9oRu/k=;
	b=mSCubHHikeG/NsxeXxMPBZ/veeCcrZCHfbc+5Up54iFqtYtaZb/KuXTHpMRxUru0ua8s
	 I8khxPNFIID+PSPb1PKUponOBY0gsaAZrIe0M/i/YFxnP5EJK4mFGEcgV0P4pvaMh2xkQ
	 BP0ej0g7LIe2A/mrIXvN10JWYpvOoXDef8D/EY8yaQcEdfrFBJAcW8lHvPpxzuilhW7Dx
	 YwrkWievgtfou0we9O0N9/ODfuvxVCb0waLHAkzg6c+Amd1ntofkeyUkAkoLIIgX3e8lA
	 yzlngfxKLJhYpoX5F2cp+dUTejrM17CO/gdAh0MRMeMn+ZVHj/lmIhvEpCknfk0YFlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPBCBpwB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayvFOWig;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74573606A31A
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74573606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LPBCBpwB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ayvFOWig
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH5e82340472
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RSUXyNbT/2UaKGkug9zQg3ml
	IMfpMREk/hGZ/9oRu/k=; b=LPBCBpwBNNR2kc7GU/rxBQn/EwK4UcnuLvuCj0lM
	xRC1IRIhNyHCTED8fvadKJVGyXr7+IkHslufrJ5rCZSQCULXnVL3jA1sQyrMNWI+
	FUfjMxLEaytl3Do0rTOwBRMD0bRfybfUJ+JRipwYU7nslrkAOKwRaRfREOmU3QNh
	tWq5ID2RxuGq/AcOYuWtcmNaHqNXThTkwR85PnM2unp22emabgATSAhxOuMHdR9W
	cL1zzXKt6PMT1rYlr45Beztc59lRHHRT3khYNOk13IlEhCg2avKq82VjgLCZLITo
	umerDyFOO490sP7IKJnrfiZVxutyXN+Gjve1rqr+PlSHuQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx38ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 19:20:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961ed97d6so650521385a.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 11:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795461642; x=1796066442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSUXyNbT/2UaKGkug9zQg3mlIMfpMREk/hGZ/9oRu/k=;
        b=ayvFOWigAXNyotWDzw5KK+DaE3uRP7lILBWVdO92rtEyfLfZKOb5D0ckspxaXX2ZRH
         FyzAYSztNtGAjHuqdGkEOXo8r1zHdvN8Gv+8s48CUQsAdEOT7ud1AEKwUX/6GbhpCU/V
         4UssPlGekmxb3iC+eOEZ08QWaZZ9G0Ofgmd0R+IBL/pcqi6bXB/RHAcv5lIrlnqj4t0w
         U/9U9lm+cm9XfVByeMB4rPd4Dt81r+YhFVNBxcQUEtzK/wvq7AZjospANbFkV0K6O0QS
         Q08yDpb5Tqx1ARWsXuSxmLryagl157/KA8BbV732gafqIAvdhcJ2SWGuqaM7ATo/vLoX
         m8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461642; x=1796066442;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSUXyNbT/2UaKGkug9zQg3mlIMfpMREk/hGZ/9oRu/k=;
        b=YyRNyYDGVO8hmNETb3d9WvUf253ZgG7AoZxt+vSOp3MX+fZCjVNGCBoxSDxPYeMogB
         eFv0Va0DXClU8nZdqyw+zfVnjCGkze/NKlfyhHtPsbJsFTdTpr5bhaJhqxxCzuGYDVjj
         GXQiht2eicCXtSIVgeGDU+utNZ7SEUQt3eSK7JUqargipwHdFYFcSVtHNrUaFOaM+Gyr
         Q+FS2O4v62G4Z04FSTt8AyzcFOiCF2C1hfObrdmnHYwI+GvuWQqvS2mjxbvkXAqkTdBI
         UOgyWb9X+ILGF1gPyNqBtDtods8UbkoRbKb7a7qD+nOXEAdLcNXNGFQurbRZYdx7eKag
         T6Mg==
X-Forwarded-Encrypted: i=1; AL+hErFbRuDau33YwARnn+8VM6d4EPJhO0R8O1TlLy9BruHp9lnrrqu7JYbCBuB8uFFH+sey1SatdEwNkms=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tXrQKi8tfPCLrTscrYzMc/EO7c+wZgpxiiux657ooqz4eh6QW
	RcZHNNywIMIx/ALi3+aK4jvNRoQhg37fvLmM6Re3Z6hyXfVI0C3WqLy3GLpTgnvJQCCuKnFFgH1
	k7KziJQp2lfTYZliM6dSpr/KJWD8Dj2z9//qxc1AmcwiINU7vMJAjx1WmEcQno0Y=
X-Gm-Gg: AZFdTZegOrue3QHv9zzlOjx3UOZJS6E/SPUzE5gfaT4C371AF2ErxZPYq4sSbPnPsPa
	wsGK6KD5nyRiWz1X8AlhXs3p1DNvAa1DCmz2AK/VH3DoXRZwm2y4FTdsmak3W9rLeP5JJCsHt5b
	3Ig7oorjG6c6lA9/8D+IeUopuZ8t4F7JPAL+YW69umV0oxwOON6o5arHC3z+lPCEl19NJkmEmYw
	TBoH44rPq9XEmINwmA2bISrIaAZxFaN14sn6ryXWEJjj27Dt+ZqYYmwvOMvaiHE+Skl55J6MaG2
	rndse6c98IEHj8byndiUBvVqgBOAYk452hiPbTiFqOaMGyGMGMhYeitdhL3t1vrsL/3Sm1PjEzk
	qGzkDRo/86pzaNnI5QG3DYEKY+Inxowd70w+JgtjDtDNUrwy5vIM6OoP8NoD5dZsQ
X-Received: by 2002:a05:620a:6919:b0:949:7da0:af86 with SMTP id af79cd13be357-949b35723a5mr2288322685a.10.1795461641522;
        Mon, 23 Nov 2026 11:20:41 -0800 (PST)
X-Received: by 2002:a05:620a:6919:b0:949:7da0:af86 with SMTP id af79cd13be357-949b35723a5mr2288317385a.10.1795461640876;
        Mon, 23 Nov 2026 11:20:40 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm22372771f8f.26.2026.11.23.11.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:20:40 -0800 (PST)
Date: Mon, 23 Nov 2026 21:20:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: Drop redundant ARM and ARM64
 dependency on IPQ_GCC_5018
Message-ID: <tx6vmkqulaq677uju7xabypeuji7avq4ib5eupwcbhzbhrxddl@yx3n3axrmlmu>
References: <20261123-qcom-kconfig-unify-v2-0-fe56c8fd15bf@oss.qualcomm.com>
 <20261123-qcom-kconfig-unify-v2-3-fe56c8fd15bf@oss.qualcomm.com>
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
In-Reply-To: <20261123-qcom-kconfig-unify-v2-3-fe56c8fd15bf@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04920a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=IGk637isbZX9iuLAz1UA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: s_cnZ2JoFT_I2SHteCyA7MMlTIyIza89
X-Proofpoint-GUID: s_cnZ2JoFT_I2SHteCyA7MMlTIyIza89
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX1QX6KAc7tGIg
 kRSvVs5V1OMXojnefr3oZR7kzuyQxAN/H3rq51tF5qroH+688fNvZM5Uhorpbveg74uFA49EF0w
 OU8Fa1ZxkrBsVY0Rroxd7rER1NRrQH4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfXyovBvmScNeSn
 hlBPYMja5gDpIDXf17LkkN5YND6jt91Ro7ofOCfd8Z/jrRfB24G42I7eQnxG86/cwj4hzzb6nWm
 CtTYKSLpJFbWaJwbLAK32r75eIlKPX5BQ07IrmXV6zYEaG1b4qK2QAiqoW5Duk6aCANOvswSIU2
 UHh8WlMZSe6WaO2/oN4p/qaLPAYBL07FCVrP7FWv8/FnFkIBqPDJ3TtvAZBhRaHNbIzz0CrqLOy
 X4KOsnnqEZxwuOMrQ/iG1JW/T+1F8aH37qFJ98GwXb71wnR0jLc83aIIk+hptzROIMPWqaENzgQ
 AdpgDVWu42Nij1IBZM3MbCp92GS0/qMZM38CQ8elGIXLB4tC0vpyYhedPmGxP2PD2qICPNWWFkd
 pMy7Sp9/dhxVPrNxXLGzM5lOri6WohzTaYqeHUUZuZNhlimEiMKT1VERN61S3B81gW7Xc4sYum2
 OWJYEsD0O0b9h1mrhfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-23 08:38:13, Krzysztof Kozlowski wrote:
> All Qualcomm clock controller CONFIG entries depend on ARCH_QCOM which
> is ARM and ARM64 platform, thus additional depends for IPQ5018 is
> redundant.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
