Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168552;
	b=XJKd+/8zl1VO4/whRir7EUNEgO/CUbAOE/Oz/OVQ7orOjgkd2uDiK9MZS9j8QT+r4wNg
	 i0IHDccC8cSVYP7VT9qqEwFS3jZmv/ldUEc2HebsXgzTsaV3TXnPI6nL2mGjobU6Su92t
	 KeD9Tp1XCZmhbgkPUBc607M3EKvaUQns4UQb9mS1NY4w4lSZvPhMuo7R+KzK22dxtA9sw
	 rPizUNAT1LMlFKwV0CmjXdBaKrubnvrvrpD17ntH2jqNqwosXGKD1QqELkiNc04GPC5mW
	 BiWmlYyPo1KJxThS/ImqSDVBAGT0C8z/exF20bpgM4/RZjPGJ/MjJ01cMB5/+29kgww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168552;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CZRtRNJIcx5tpZcE/meWoEdRLmxr4t/Ov352xPdWbsw=;
	b=3RLuFgIhY5qU3AcQnMs03WPAg42pV9SJdB24pd78233/MY+OSRAvPcZOXo1Jsrf+GYTm
	 LcKQVhzEhXreXLYkLMX2eY/amdaBZwgoGNsH79k0+xw+a17Zu9IywdoTbjsSeO6bsqFES
	 IbC3WyYX6PXbO2NMkXHPDAYAMyaSe5Zjb/BIhrLP2Zn8Ynybzrs49cTKqTIyIQTGf7/gi
	 90cBZavg+eUTQ7DgK9GEawR3Hp5fSEWVe1tFAOjn5LFYTUGwAvg+Oc5EJAa1lLDRPE1qr
	 3Pdj1FaXgcZa2UGUKIQyflQxipCull9egXunBt89wMJUmImi/aVdJdfWnIRswZmSjiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PNE9y0mU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STpN2Lgn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B086360A2625
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B086360A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PNE9y0mU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STpN2Lgn
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fLNj3321154
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CZRtRNJIcx5tpZcE/meWoEdR
	Lmxr4t/Ov352xPdWbsw=; b=PNE9y0mUiLrYKREnSHniUdxHBIY4PWHWFixI1wgv
	FraznClJEgaX63euvpphzVxRdt+tOWJHB8aQbFTKSvwuYx6f65wj+KraV8QHI/Ha
	G+io+tqrve1ETeIUvsuzGghPvJ9/AfQgdVqn6abt1MhBL3i4pmh7hCCRz1kEfoWX
	sfG31EvPyU/ouxZNEuLlSvgUzUavAuu4tfQ+GaLYQDM9uwHxcRPM/VVpAkURydbY
	7C8Aw5qqEowK9TmQakArBpk+w7jDByIPTPhj0GF2mVSiCl/2IZqhVaYJN9wpmLCs
	FgkfKpgFvdkzi9W/Kf9VUBymuTosoVdgjihyxZgXGepytg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2frhs69c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 09:55:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so137429885a.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 01:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795168550; x=1795773350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZRtRNJIcx5tpZcE/meWoEdRLmxr4t/Ov352xPdWbsw=;
        b=STpN2LgnfGQP50Sb3P2ahctYc18vYbMMAvbrQAXP6LNsVVf/eRdX7r87DG5PqvubkQ
         2HeHU5kabR7e/ZZilXJnAXvnr7ZuU0hTcRbWbns/FeaM/4MvYA9Am8qNsVaeGxtoIMY/
         QzpOeHcUrvuirj3qCz1qlj5zuee/wURLSg4pXKOKLNlfWXQ4kJTnDJJSk2fqhvO2mP87
         0ps2w1q/J6AE5yq4aVDa/y6i5q4prtnD/sz7q6TJvcD/HOZj2iCG+qtTmagIyDhn+cZK
         AWXPTcKMQFttGuY/r2jQwZ9Zan3TGxFeWxWEVnz+z0ygorIb0ZYMogUTS0mvO7fzeAsq
         Tg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168550; x=1795773350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZRtRNJIcx5tpZcE/meWoEdRLmxr4t/Ov352xPdWbsw=;
        b=Q+i8vJB7HkCkmcxWZWZA4XSQ9c+QP164mkvirz9mEoYPoxMWbDVU4DbfaewhW4/elu
         weMiwBteNsWbTNlN37gtazBV9uSS7skGY9AsZGkfMUzCok3WbgOkYWkjtA7JuJ/HM8M/
         LFLAWO8Ose43+d/vFVBBMEyKaey3VhYCCpEw9RFlChTLUDI6+RrVhsz4NXd3ukqAPxtt
         lb99Qc7nHORSVRJAKEFCLabAmMP3/ehItd83zgSiegsMc5Ud8DHa3syUnrwQTxcULGUD
         BXM1Uf98+bfoc7msnwWaJY7S7t/xgInTyWM8p0Y+ETOSI5axdhMDK7YEyGQ1W0L4VmvH
         0JdQ==
X-Forwarded-Encrypted: i=1; AL+hErGbTg4w6JxrWrFg5Lxe5IFT+klGmjNy3EibCUc4LANmhuU+hfV0u7V05FqToeVP/pBDq8Bv9BAikps=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ofGkQ4HeGAS82kb2dJEXkkKv1xcbP/SHjmS9hk8i8Mvl5FhX5
	1A7x2AmeHsoG99Bv1oVoaylG3glLbTG+deWsg8D06yqlQm+KtVd7L0oE16DUnmghTDRcGFy8TrN
	wvQF2RKOarpNFH0yExP7Dqt2AmTWzKE2ARSEq48vVXc4fUf1XdmPi5O/fKyrN1Bc=
X-Gm-Gg: AYBFou06GVyXqtR4tDY/rpLM+fPt6kIQxAzkE5e6AiEPXjbQeT9rSWzjT4OoS5108W4
	8jJFsVZiSvwF3sCyV0pIiccXlT4DNMBaNr3f9gySojq03PrXCTpbM25IhhNz7dUbPUALffZ/z2c
	CjXFzUlX5NBlytN/+54bemn1WSdPdA0mmv12fdLiZl3nJjgl7OyTtSY276CN6r6GUrN4+z7UvH3
	91AR2dBEEFLPB+zpi0xyXj6X09kj2w+BxKqGDWjj0+ggkK8VMtKE96ISQE69TqydRihYEg+LYtX
	qX57PKbKM1R3tTDI3ehXHPqMiULMTiLDPoMh/grISWQwdQM8xxji5rLGVkkHIAOK39qd+GknFbC
	lShf07m7Fnga5jLaHhIFh8TWTfifCa1baovoYRCNGVUN+Jebvaz/zzqj5kM8/sMZb
X-Received: by 2002:a05:620a:4446:b0:949:6574:f367 with SMTP id af79cd13be357-949bac8c5a9mr375969185a.80.1795168549881;
        Fri, 20 Nov 2026 01:55:49 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:6574:f367 with SMTP id af79cd13be357-949bac8c5a9mr375966185a.80.1795168549285;
        Fri, 20 Nov 2026 01:55:49 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm403031f8f.15.2026.11.20.01.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:55:48 -0800 (PST)
Date: Fri, 20 Nov 2026 11:55:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: camcc-sm8750: Declare icc path dependency
 for TITAN_TOP_GDSC
Message-ID: <pl47uhsz5kdeotyf3iooknskoyltx4u3bk3rjnqw3yyncfatwf@kdm6oukmsuzl>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
 <20261118-camcc-fix-v1-1-279d269e343b@oss.qualcomm.com>
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
In-Reply-To: <20261118-camcc-fix-v1-1-279d269e343b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX82nXp4/uJBU3
 LL5EV58QlpZ72IAzK3yM6Wta2nWbO6GLXAHlrxsF5aGjs6aRO/4RlipsLouuIAccgPLJmHhkiv6
 udnYIBxcZr+KXJVXv4fMaClLdXoTYSs=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6b001926 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5oq0a7C7ARd697Nuus8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XktSeNUHMjJ31uE5E2tOdN7ajMBD1lSE
X-Proofpoint-ORIG-GUID: XktSeNUHMjJ31uE5E2tOdN7ajMBD1lSE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfXzkuwYg5S0kY+
 9dr7AP8Urn08idGTmCJsySLmbW9nQYF2vK9YhjywjK/iqWNcwmvIqpUbwjZwAxvYuBXs8KdTd6t
 mZAuLl7VKq7Ivo6RPS6pzPqPViRk95GJd3KREjuYaHlyxCw9TbBM1oGtLCf6ALNQ20mZ6rDYQEf
 m5oPP77TYwC3Vjdmv+n7TkBz5asH3i4135OEeqouD2Y8Ung85/XV344qMNxsRsw77mWCnYBVFIw
 u3MIaYQLxztLFKWpmZvf8Kc9DcBVgSYSmFl8xTXEZ/EKhlXh864fx/OFB4wD7miGXmGkhoOAmkh
 lKWOZXbA27f6OgIU6BKAz107lFu0bTDuPkf64Pfc9lyZYBbVcQfZ1MiC9ZmRMSuM580f4z6UBqG
 uvR7h54SyoKnJ1pvevTfqwzZZ6RBmAkd5oPFf2r0NxXcCA5ADypHJWA14epnOt9m8LMJfvoMQMy
 EYuogQKLSjnU6+qSK3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200039

On 26-11-18 15:45:05, Wenmeng Liu wrote:
> The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
> without any client vote while TITAN_TOP is still on, MMNOC attempts a
> power collapse while camnoc may still be active (QACTIVE high). The
> power collapse then gets stuck, and so does the MMNOC BCM, so any later
> bandwidth request through it times out in RPMh:
> 
>   Error sending AMC RPMH requests (-110)
> 
> Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
> voted for as long as the GDSC is on.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
