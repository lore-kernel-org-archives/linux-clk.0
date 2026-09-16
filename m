Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F91F4F473B
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554912; cv=none; b=cIPjBuCoBIvyxskccsgwIBqcsWbewIkfODHbSKmwgaU/s0jy7ub7xvNJZIC+aOxp0cg4r+4swH19Sl63Y8ypXogK6LX6ZDuQNg6Xn/Srn1bLVKgjMlbyUGIvHvbObda9xr3bVxVs6P/cxO50RoWQGQwMO97btZdZNFN5BvUdYRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554912; c=relaxed/simple;
	bh=rnKW4otznhYYxKyvoMqtArvWEdZaaE/10Lic7azmXbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fiLmFBwq3K4RJ5jY4QmI+4uPZbUvQyZ5riTa1UPJhbfdrqHs3J65TIP9r9MBJFvMgRjHLp9nK7v+GQ+3NwB0sTagDnA9HLzEWQ6pFkAW8XHxv3Qhd+Jkgk5XXk4g9BjoihM4WWChwYkc/GshktMUU9rBvY4/b6kdEbUdKzGlkhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4izwLC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvBklJRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4izwLC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvBklJRH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G933lp1587182
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z55CMID7Tr3N5z1gzpPlBem0
	1Rigw5Xcv5g8Y6+kKC4=; b=p4izwLC1Kx8jEq827ruZiD1mS2WDTVlahRBffk0v
	EH4YSngSUcsZUkLBfZGxxpzHNDfNEZkqGehdW9//cS/M+6YN5ePq8kRYGtUHjY4/
	pT1REhit3JmjEFJ9fCcjlV5LZU2z7EjT2niwbrlsNTri6LHTDI2amcL57+pLUq+d
	RuW98k8bT23SaCiKSjF9ooMsiCU7OmRalKm9m+nf5sicecUaRn2jfc4ReF+Szft3
	eLQSFiTd63tB0X4oUvce/dUpUcvSoJsnK9xuTAORKE+/Jze5Zs31BgW5Hyn7262S
	SjnR8GVa2XfyqF2OVYPo7XhPz350UcDci5QzC1peeuNWWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageksyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 10:35:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f925ba4eso21262585a.3
        for <linux-clk@vger.kernel.org>; Wed, 16 Sep 2026 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554902; x=1790159702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z55CMID7Tr3N5z1gzpPlBem01Rigw5Xcv5g8Y6+kKC4=;
        b=MvBklJRHclXDCjuvZuHLOX1rNXuemhw1N8fvHX4RNGI5Ce9NyoX/Gtvv91pv+w4oX/
         Z+DolG3clpDZbgPvWv7dZdeBJjGLOY+J+BRIKt9+c5+7oacZGBRNK/TSN/VW+N8upDix
         bwWR0P8tdjMWAzuQroG8m0Y3a7RpfRoT1y/k3aK2S+r9lCpEYCd8el6IvN1PWvXP/Vjz
         /6vVNOURfeCiio+H1lPT4jRFCY/Q/ItoTesWP+zpKbbArw1otZ9VEnCUAMuxAO8+vZSU
         pKoJw5jlJuHvM2z5gP81FKV+JSCzi45JhEo0N5xnzgHIdKGbvaYYKj059sMzKmiHuzU6
         8IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554902; x=1790159702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z55CMID7Tr3N5z1gzpPlBem01Rigw5Xcv5g8Y6+kKC4=;
        b=I1imiStQgPsiYiqy3/VcyKTakuuThKRvO8tvNQH01fWUkn7djF+2tzhlMXsuqYByGH
         yO3nRAC/RybHM5LlshrBSVzzFt3UT/YScFfvRbiveIxznghhiI0VeWFWq37K0rz4CBgX
         UmzdlqbvhAQhNmo8066SAC4pfdnqHv3MpJQ8EMAaE2ykvhAYbiy+EzxwRKOr1fNY+B6a
         nsHs98xdMZ0hIv5REqf9P+K+eg/X3S4L4mC3wtTj81ln0qRKUVsmJf5nOfP+7kX1VaTJ
         8Q7rYhCMTIlj+NWbeZxQVXj1rLfZdyvKUtCz+ZThkbglAX7Xayu0nUWnIbJRuxZHy1D0
         BKgA==
X-Forwarded-Encrypted: i=1; AKwUvBxVuFtmZv6qYp4y8iMu2R/YsPC3guATLZtFVzSvxM/MqOxGekPutT76gBXaHM888smsmgeXBdrirzU=@vger.kernel.org
X-Gm-Message-State: AFuF++k/AKkk4dUC9QxGPf09ie+Lw2zijGtIcXD98M1Q40pNNgBtx2cI
	7xSemVC7oCJ4YXuubZoeWmI0C4rY0uI3ZcZEPcOSFDI/8PAtT5eCAYKScOOs3WWax0GUxiUSui5
	Xzr3NlHBzq/W/z/Dj1fW/Q5zJFHLHVVhXO7/GSObtjLY3cbYnRVjRNmTkb7WM3yI=
X-Gm-Gg: AYBFou1NuyF8aTQ9sVasIrwPjrrOcZltBTY8uyPVb69g+VZt/85YkMIAMVVOMJEygGd
	ze4jWKQXBjfkwVHdaO7LDZiASBkx3s/fEZg/4mkOPUMD60Xiw7AgPIr6lgRYID4LlSKveoQa9Ef
	HrmLHqBCqK4YoULV8HvohkA6FJ5WnVGC0h0aVJnIyQ3Tp41O5a1h8giWp0nn42XGrvVQf0j8ctc
	b7dZfuwT/Zjrm7hK5V9M+dyZ+VpQU5Slc7OYqkWstugPscP/e4RjfqK1bNKFW6Wvs92cnX8MsX+
	JAVLMed8bQK32RJzhDsypCxbHPmQfdNQoFzglyxrtD1ObWV3UKFRhbMS+gTPfTSJ5x7lN90iDVr
	ldi/4DcyGqxLAMxs=
X-Received: by 2002:a05:620a:172c:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93bb76c24damr299727285a.1.1789554901762;
        Wed, 16 Sep 2026 03:35:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93bb76c24damr299721885a.1.1789554901212;
        Wed, 16 Sep 2026 03:35:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf413dcsm6116706f8f.31.2026.09.16.03.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:34:59 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:34:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't poll the status bit of
 GCC_USB4_n_SYS_CLK
Message-ID: <l5uzxnxbhmnmnsutvtfkaoz26t3el3vy2vsylx5dtkwaunfgt2@kk3ky7qb3f2k>
References: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzOSBTYWx0ZWRfX7khk5ytajIOG
 9TeJsjMcPh4oVMdJnmViA81suHow0H+uV6lZ4BekeLE9lN036TNAvAueI0RUz2uKQL7QEfQrsHF
 gjYbVn9hDq3ezuJXoUBbXkHQ6Wa70Lg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzOSBTYWx0ZWRfX4aAWTGNRqD13
 tKdj8shZC1Q0aD5ozrz5tMQ/neSEguGubezypRcNCK3qrWl+I3I3z11BXPOTm4RAzjm6CMPIgZ+
 Jm+sAQ/uy0ZLtsztz3Erv/vimbhroVlBCY14puKJ9UTDpSRGun+F1vjakExtlrTXLgvjEKE/ZRr
 e0s5byKWS7Oa4f2bY8zgKv9VACWSsgsPSrbP8b2HQPrLIw3FQ95tc85oQopTv8/Xe7ROLL7Y5Qh
 BaHreKKGAqccPLZgimtu2e4WTUUJwQxo8nV/hM28Xe+PAF5TEp3d/XKqv710sfpbKNNOND7XPFM
 JLSiSi7bp32GduFV7Oge8XbwEctejRjZlkLdFyfT11JlUzygvwr40E+w21a3V/BvyOuojdPunk7
 JIpjqIDsUgklta6f8AMATW2izHwc/6NRvHAbtiCZa8LnXWVnkwoQXo0fm5BvVYdaybpEoro73Hh
 NmcYvUVnv6nSaybqB3A==
X-Proofpoint-GUID: 0wP4J4GQJeDh6PbSIOdY5jbiAkqXw0ko
X-Proofpoint-ORIG-GUID: 0wP4J4GQJeDh6PbSIOdY5jbiAkqXw0ko
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa70d6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iflI50pWzB_WzTeptnUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160139

On 26-09-15 21:18:15, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These clocks are PHY-sourced and their halt bits seem not to update
> reliably. Ignore it to prevent spurious warnings.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
