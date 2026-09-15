Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AF138C421
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465273; cv=none; b=SId01q2cwNVioti5PoNDtnLKr+qWqrjzjhgmgHkmBP0tB+xwhNePgWru0wqqReuIHK1/fi7jqT5aRDDFQJRQ4Qp40qTtJLJKjoLAf99ZofNQZsVv+IxZizlkNEWZyduBB3/Eo6NP33IRlG8aV9Wku6kXKN/+Fq+gCs1MN+uafSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465273; c=relaxed/simple;
	bh=q3zQSp8R5ThK+kuHcvCcKCWpGwONhQglnuUhseaqY3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiakn+DWMsgfGwOEkAuUsBvSCqgyBmeRMpMwNFD7c1YVhmSccpPc8bWfplXtx4DVupgTumd5EGgKKdhNNFmMTPpbNCyAn8FmWdoavCj8P5N6RZ8DwzOMjD3mmsMrGMsgJ1OETlbhzEyGFXxCQjBDt02pwHl2U0fKnWnltCWzp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhDqY1vY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gC2V0Xng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhDqY1vY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gC2V0Xng"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9GhYp3258011
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AKPLf5lF4h3WJ97ZL0JL3uGK
	N0ClGEh5Ox38KSn5et8=; b=WhDqY1vYS97v04zv2GsHbPxjzeUMoJ4CAofPD/ra
	FGDTnn3/mThnJgHVy1jP4oDm+TyxE4gwH+tpiwt32sg+0sM4wTQ92e4MwrlZ8rta
	7FSBacv2UGwZBkgL8JdlmEMHRAJVxbgs0KBH/3pRNLRdW5PApsE5HYtl9WxLJvfR
	n+YxFof9hq7YsmL2xP5Y3w8JUGvECcILK7NKxO2nH+Y6fTyIt8JiVb5jnb0Zi+wN
	tMMdDJasxqkVkwLY3mfvv56oflucAVUe78S285hQc98qQWG/9UtKuDlX8+Xoq5s2
	bZjwyCXEXb7rNtLLel/aZpQQksygXCi8unNJVyOy1d9aqw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e03fc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:41:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso686839085a.2
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465270; x=1790070070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AKPLf5lF4h3WJ97ZL0JL3uGKN0ClGEh5Ox38KSn5et8=;
        b=gC2V0XngCo5BhWkNaEnB4QANdQtRK3bPLlp5Sjr5+odSy7omUg+tjA0CHtett6gzcH
         PWtre21QGR4gX4RO2y1mJThbkCdGjagv6EPhvWjW6YO3b7cYh1EUK13As+GhvxljXXGW
         qiM2y/oIqFwODDsh4EHcEzhqfVzBFw8V1C7FooiWHdIDJVKCvWLOy6yg2Mst8E8fGPqn
         KPoEp6Qb5yjP4v41YJGH/9PU7XldJN0NuW6XSFQp+Py3mw1RXW1oO931Qqk3cLkoLEn+
         AUw6+XZ5OjHjXv9m0BoJgy5XI7BB0AFBWUlpzJPr4V/Etq7Fkp2nbA7+qm6gwt2rqOJN
         gugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465270; x=1790070070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AKPLf5lF4h3WJ97ZL0JL3uGKN0ClGEh5Ox38KSn5et8=;
        b=j060DDcGuLn5GPCD9HVI41QnHCgF67FwSfqdqZF652id0PMMdS7PAf2Brbch4mkv98
         LCdxpDmlrWLBJ5taLkH6uOUcq6XG7nYMHJtY6r/+5+ojEUIno7JlymgQxLS+K+mFQxL0
         rVtnsItdDB3zRdamQz7OkG798lU32WCznB/h2+fiVe8omdzsbp7kQjyGIkZTrzdhcUSv
         5eui0Hvg0z4AMWY0eksJrrZCMDIOxCir8vr4OkeitDlwc0kshmWZO7K0qwSqvpCHYvAq
         VwTAbK4CtZcF8QBW9CS3pDjN5CpRp6rjjwJt4f5WWr1s2KGUa84ufeGmmGQqF0qUdkJ7
         aHkw==
X-Forwarded-Encrypted: i=1; AKwUvBzRoiyWHbVHaBWL6tcvLTNw6H/XxL+OwaMEo5R9oJVl4dncMfK/0E2rKVzjE3UIdhbMt6Z0L31prcE=@vger.kernel.org
X-Gm-Message-State: AFuF++lfOCR8aLBhlg4nwnZr2dP3kAEeXgXeVRGgHwXftzzzvSzpVy/c
	vHj6CQWXCxpivSc5sMssc/kd4r44npNmfzPKy6XpERuTXUrl96mcRW2Aq7f5G1f3Eqz/+71CGhk
	G4M0f4XQjvHqth7I/MU6fU3u2hrAnqVB3qW799fq3ADTSQffzo4Esnjol4D46Rm8=
X-Gm-Gg: AYBFou0UUHcLY19WYe0Z/+EjYcrtqiX8DTtWB3fL48/uzsys4hS2YWGOwqdQOmUvcaU
	n19HEKZyzwd4CQGgokW3ZDKjLuHT8ltjTFfkvB8dKDGPv8SHFa57u4JcSBrJMbV604Xe3vTRl4V
	ici96RjVuBo4mkKdAzaYukjugV7n2BtB9NlJ4l9I+9O2jwOOnP4kEsYR0v7CbbdDAlse0an/OLJ
	HFF9ZEp8E/FlPpSiYlnvq8p0IkfXRt+VR9Tr/oilIwYiHC28clR2Gynqlhyl5jRy7p5o7CHz4/+
	pp5XQwDbdiScPnr1EX+a86Ln+KdRcNffhTUJL8rb2C6sNLHEud8c3WL+Bp+Tc/fyDhnuXBUTlg3
	2+OwJ2xdL9ntFeS0=
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr891549185a.2.1789465269917;
        Tue, 15 Sep 2026 02:41:09 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr891544885a.2.1789465269342;
        Tue, 15 Sep 2026 02:41:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm30667278f8f.36.2026.09.15.02.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:41:08 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:41:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
Message-ID: <tal2rc67ojk6bcc2rz3shogvhg6c2j2fngsjsgpow3okidkbaz@mesni6h4gggj>
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
X-Proofpoint-GUID: hDdadVJeKNdHRLEKHIi7xct2UEhdznEM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfX1Bl6ev+QD8OL
 V3v1JIJJamRl+w1G6sdE6kmkJ8GfxETDpw9sLE29XhtIuqJPbxMneGWoFDH/BlnXzT5eijK9ASk
 UxU5XOyzwF0F1ubdZUBPchokFcCO8k0=
X-Proofpoint-ORIG-GUID: hDdadVJeKNdHRLEKHIi7xct2UEhdznEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzNyBTYWx0ZWRfXyUUkDS09Na0b
 0lrpBYrse5cJogOfVipwGHoXl/68XxQd4T42Z+a/1BM4K/HDsxYYgrjXl7bnMA1t3F7Y4wRdmrJ
 8XZ2ufsD5Qvc9CZ10BXdW3xppInz6r59H8IGXJS50nHV3q23mfjdenfZ5sZgwizIkdsr/rjt2Sy
 ilIHmuDCuZDAYZYjcKjuTfYeD7FGKLWY1AOnspyd1PS3HxfLjUvT60vz7DOpG+jeGnRFvsgGb2H
 MX4wONUx7625LNIlWsf/Zl3bbSVBemGeIfWB5c4r0BDKI1bR3i5NfHpnK5WLqVQIwFuFtXmXV4Y
 kKJb2+9uS8RmvwxOHpBZ8sVe+tMBKX11eKzWWihTTmpHziXEaZpCbt//Bn6Vv68G4tRnFVdc3zx
 /+fsGqmIQ+WiQJicuaU5U9VrinMx9xDTeg+jnTbb+L1P8tY44fEZSn0ubDp/pALCNl61wOrw/mH
 MEmJM8hPY1BgdAul3Ng==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa912b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Y1tYvCCEkdZ76wmRb80A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150137

On 26-09-15 12:28:22, Taniya Das wrote:
> The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> Drop the duplicate on EVACC and add the missing default on GPUCC so both
> Qualcomm Glymur clock controllers follow the same
> depends on / select / default / help ordering used by the other entries.
> 
> Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
