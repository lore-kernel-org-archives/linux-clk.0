Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188226F2B0
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328899; cv=none; b=t0eINpnrUyUutLDRXd/3YyZkwGogulTSL5sdsGK27Q6yhV5IXz4FjVGtLBvJwuZrozRCllMPPlj24h2Z7nCdbaor6S0zaMJRYUT/PZ5WyQ6LBkfIIeUwX/YSwyXADXotAW4H32JhrQ6x8X85uNIl/VpdC8TO07cki2HnjyewP/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328899; c=relaxed/simple;
	bh=vrYq/uiAVCyz7jBM7IXFxTPKK64eUp1A3gkelnJyr6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mtYa26Ecah+x95dAioYWWM1np4zLgktWw+eno4rItQHGmysfsWFgWjgU4Ab4be8wZarF3gLW2rlbg4GPeJo7fNlIdxlNTLjGoM1k9cglKh/X7zxIq0qOF1YUZLL1hXLzCVw/BRC+rGkoSfP+lO/wik8z42CHElU9ljs186a5H5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=otrwtLgs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N4dZxMZg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="otrwtLgs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N4dZxMZg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H83i9Y297034
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dvcr3dnSYivkUw1cTNa360G+
	1MU+lGFu8IiI+q7+qaQ=; b=otrwtLgsc/1PWWTcyErQcsCK6+nFapWQiLv2qbNI
	tpkJmuG2sEPsBCto9mVAf9WIVZ6+Cg9TylxCrZotSrNW1LEsCs+vhnqoEAhhBunK
	aafIIkI5ZxWkbmiWCtzIoUyNjjdYrCHdpG4Q2gFSXZQ5iMi9dvd3cU2lSy5qOCuO
	XhQSpRNxCYa7hg8cd8IsYCss65MmUpNj5GwP87gqbiVGdhGMmZSFxx34cJwhd7mt
	GoSe1m8tNGOzzlbH2PAsQLy1miYr9QW+MPLbikM7TFJsRbq3gLSFBwCx4/yo0rrh
	XHk6p36XAkKAd5u+ixFTvCym5Px6RxPECmAfCVTJw/rPzg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9t6kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 11:48:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70fadd9a3so3398300885a.0
        for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 03:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771328897; x=1771933697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dvcr3dnSYivkUw1cTNa360G+1MU+lGFu8IiI+q7+qaQ=;
        b=N4dZxMZgsgM8HT0zLCt/EChqzi9jOQqccTY0YDt1+pz8dcB/pE31ntKSpm/K+tL08+
         64W2t+PeIISTDRaEAIVdhKw8Mtb5ZvLEBjjl5bfGve130f+9e5EYdULGWP3d3NH7khJb
         BF6k3/4XjV/5NWeCPb+UxE4s8FBmv8DNI8i/dEv5+4ab6SCfKqJcWYqi3X2SzL26K9Ug
         8lsox9JYbs+WeLj2SH9N89ivYz172DZfgrVDgfsnmdqqDnNRjKK7hZnNcCSi4zbmg/Wc
         aWPishDADecyRelwQ8vhXAdOgViYZSO0PPsvjjHNh96E+sh9ZmdnDbBDWTUfvGzeShbC
         FMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771328897; x=1771933697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dvcr3dnSYivkUw1cTNa360G+1MU+lGFu8IiI+q7+qaQ=;
        b=WEGPLaQmd2exP2kHYaR3zSZBqsriDsbkh3Fv8okhekbYZrmQY3fRj/X2Akby1xhi4c
         2MQ+4MnpjBTBdb0hil18M4T4mfHRh+uiLV0RI0C62836ftfPBzSnSVZ3uOLcl3GlpRCG
         G0Ud+iP3kwJomYA/dChVZNDeSHlePKLaRh+GhflLmtC39uIdnp/YdjaEFoPK2hXxGA9b
         xl+Eu/T9Visgge+fNml9EVmHnuT57jX/IdObpSLgyIKkoPRft+belRBFfPN8LPJwI8ag
         0M7hrlqvDGahfaKKBOhRhY8B635rjx1gGN91nARNiJMCgyrjeMLM6fb3FNB8xpixqrvE
         mGiw==
X-Forwarded-Encrypted: i=1; AJvYcCUtulcZEdQ7+cen7XeQbJfViJzZEF5bgE9zfgyGxxyNbY5eqRXMK7tcdKV4B4z9qqoy7wKXuQjS+04=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3iDJuPjfe77/HEtmfjz/5ZBFHx4mpMMXQIdfWbjgTNxAfGhJx
	hkBM6j2/CiunQld7OoshCvu+I9Q1h4zp8qvbgZudBom+9+9u7+XUN8C+syZhFSZkoXBXHiL859A
	ptlYFfCw/5RM08T2mzLWqJABAh7aBUgRp3cmVOSioPQyPMc3eD90ddEOHmGL4yjk=
X-Gm-Gg: AZuq6aLrQqhuE3LiKo1Psw3wYkpHqhtIYVJ9dFxj9qDQUaTQr8OX6kVOd9LATPmIvp4
	uXDv30+lyTxsK9SZ+7f0djB9Bx1dcv7IcjPbWkZLWNSRKv1c1t17sxMMNLMxLCbH+CxW1+Bvyrj
	J4rFv2mo/EHiZrqRGBzHKfqXt1DJ9gKbdme/rbZz2osaogFqSXX0J2Hkw3banLfjoH1ckgo9grV
	B/Kn6Uhd8C/vTSKikODT0x9G57Oe390PcyX9bKFY3nemvu68b5X7XjEq1VnOCkT96XyFpBbDsnI
	ju1ZndhmjEL7bzAgnY0GDlm/rgKni9uwLtCqDv6whA5i3phZiYhOgzIIbbq75/XMYG4aPSWqdL6
	HA3IvayUuXLgTvohG1gI5yRgiKl27+p9M0kpV
X-Received: by 2002:a05:620a:2953:b0:8c6:a5bc:8a90 with SMTP id af79cd13be357-8cb4bf9708dmr1345720585a.14.1771328896661;
        Tue, 17 Feb 2026 03:48:16 -0800 (PST)
X-Received: by 2002:a05:620a:2953:b0:8c6:a5bc:8a90 with SMTP id af79cd13be357-8cb4bf9708dmr1345717785a.14.1771328896228;
        Tue, 17 Feb 2026 03:48:16 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5e11f5sm531678215e9.4.2026.02.17.03.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:48:15 -0800 (PST)
Date: Tue, 17 Feb 2026 13:48:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 6/8] clk: qcom: Remove tcsrcc-sm8750
Message-ID: <sxjrbxwi64ky6dcntpnnbi3y5ujtssz7uno22xiwiqjdhp7rxi@b2nsnmb74vnb>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-6-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-6-cd7e6648c64f@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfXyfTupPUXMfoy
 c3TKRANR/8Pz27mEsD3CeMvZukj1EwAO1HcFmp7sEseVZcd/bw2O0UMATpT7ctcdAIcLiK7KTcA
 a6htGk+5CUE1j5EHc9Dw5L3YMqIkR40rsEY/7oVYlJN+TU5o++BH/8GS/C3iZ+xpjSTe9W5L441
 sHMiE3pBFIDuvv+4oqd444e+wGvmtAO9IpFEophiL6gfZtP7/4w6CHqmBwBK49M7a0kn9Mt4c9f
 yJBXuukjjspEj6MtqIaNsqbd7CiwhsgGHcMS/253lFBSdtrCh+vKLNiGYoF1fdfbINlGgNaLFcP
 aM86MBmZah259TgClxavLKmBPORiHBvPS3dRckdH5njW4Ca/HqFoKUMY02SMuon0myQvHx5sxAg
 wTu8lpJNyoFJc5ZZaT5xDAATC7nCaoJSK36svFhyG60GJw3LDaHlUJ6ozv+BfqPYJBJVr6xGTqM
 GTBRFHwclIiO/w/RBpQ==
X-Proofpoint-GUID: MqNmmK39d4Gyyqw9XFrS7zlrV8to4mIU
X-Proofpoint-ORIG-GUID: MqNmmK39d4Gyyqw9XFrS7zlrV8to4mIU
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69945581 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=alLqWcL6K6sXwBa7AUEA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170098

On 26-02-02 15:57:38, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is now handled from within the pinctrl subsystem, since there is
> no "CC" block inside SM8750's TCSR, as the corresponding hardware is
> present within TLMM. Remove the leftovers.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

So bindings remain in then...

Anyway:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
