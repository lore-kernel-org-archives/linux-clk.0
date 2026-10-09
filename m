Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104AA4F0544
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568632; cv=none; b=IPPf8BUdukFkWzIxKUBEh1mbiTwZTfRRcNpuNdqSIIpbSrw4pTkYV/XLIGJ1oYVkKhjyw82xz74dewuGRi+LLeGY1AaVSkrmmqJbvGw81Pks1cyHdABzvHhHg9wHIu1xpn/BT9/BcseqmY4fW7LC5TJfUyaO5muT26zBS9Qb83E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568632; c=relaxed/simple;
	bh=Bjsr3xCjRh+8NP48nDCjT0VwEkPEFn0qIrSyn+hcM/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3FZK6ivHPsuRtKz6FyffiE506fzcIKXHJyIIKMhMDr7f+TfG/2YovekCWq5JTzwJrr5aKbySRHJOhYCkIx7zdZEAsuJuGSkqqu1yj7J8gvyrAAmJu2S7Zn4Pxm0GvzhXRICzE3Y/OYww/uD3YgrsgW5Y6DPRfuo6on3Jsh/fio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fs5ItpXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+GBjQ4g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fs5ItpXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+GBjQ4g"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZVo72144286
	for <linux-clk@vger.kernel.org>; Fri, 9 Oct 2026 17:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nffAJXTeBwjOSZqgpOqFZEPR
	9rRQOvtq5kKplAVEyx8=; b=fs5ItpXtZ6Z4fUIdclaIlttdaiY0b1K6omQx6c19
	Kza4b+OAIueYLYncnT5jrjtATSbjlKwbWpbYstvz6iBEFEpPabydHiCs1e0jM70t
	gUSdYWl4HdVbxGFXDQlMP4fqW87x08UMANQw9d9iEXy8NLOdE3WlnT3llrOg/GRD
	otDWMoaQhUEwsUdcbq8pmrmf+kwlu8ymSNXEfXSa7O8Kio0LZB7BuiImnGaFstEW
	VY/5rw1CHoINxONjE0t4rSEOQtB3cJwjNzgNnidQAFK3DkFesXdQ3+jaFR27m0Fm
	4GwPD1Cyi8XC5FhuBbFsf2JFk2Z8aZfRxB2T+f1rYr72Mg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7r2gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 17:57:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc7a6e4e1so1853330385a.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 10:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791568625; x=1792173425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nffAJXTeBwjOSZqgpOqFZEPR9rRQOvtq5kKplAVEyx8=;
        b=h+GBjQ4gXFHxJJwxOeTo/T5eDQzYmvW2bHVc5U6HNby9WJlLLTh8Ypfftjqdo4zF/L
         ae/Czjse4fO/bM67XAimW2R6kzfUHiAydqIHcr2ZpFMvqjMPWZrjfiG3mT7kxO2HuRr+
         BWiFvgQ558aYP8fWNmdGCX6lkQrh3vcfoY8dVQEjdTv94V9Y4n6Zwy+DChoQEb4GZ94H
         vekmJbpJR7NHCzXO0/GmnkTnD1Osw1SHK/FiqVnWLQ9vyM26dv/Ms4nrPLs0D6+SfPAQ
         GwFA5Y30X9iCJA2RTXazBYkmWtYO0R4Kzz7cSFR3IBbvyA+xsZYmsHeu574IJjdAO9hY
         a2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568625; x=1792173425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nffAJXTeBwjOSZqgpOqFZEPR9rRQOvtq5kKplAVEyx8=;
        b=Cmm1N7YbhDgBkABOKp40IUD1iLqLdmiIBDGSP3VnU15zE2eIrTESIWzjX3VziLOFxt
         xz35D2RuKezzUUfRXAwKyS9/aB142VCAoiWy1oat1tdmBTjA1PRBf0T4jx8ciQzcQpvJ
         1QI3aev2LJ4nvLvRHLpGNhDt4nSQm6rsB9QOkgCx8E1oVP7mohYdweV0268/I8G7c7nU
         rOFHucIp537N4Ejt9Di4fNlA2sS57BshKTgKPsKKE7IgaQiIVWVyZKvLV3oUruhZ1zJq
         rcSP/KSFbSWZ8io8FYw5b8nDJ5yHGlWxcfDxw/3kZwMV7eE1vahiGZZW3RozZG77DdNm
         rBJg==
X-Forwarded-Encrypted: i=1; AKwUvBx2gbwBuU4veBe0cBUe94YkVWhwk7Bdm1Dpjy2ixCllrGjnPZe5O6sqOoQr6CXgCwcP03fv8ULhUbc=@vger.kernel.org
X-Gm-Message-State: AFuF++nv3CL7r5ad0KaZZ+1HoaT0ZAHKTMrfamUX+c8lHGIMhnsEnqIJ
	/4eE9LiZ19zOq9HT89zzEDgDme7Si9m1uJR2JfzCJsP4JxWtR2W+xFRbYTPYDO7DD7mmv9qR8Xb
	fHJ2GXsL4P86RA9F7JKTLO0B/KEBRPf8BTEnxLHaGUvagiDrRV6hWXeyI/frybPs=
X-Gm-Gg: AYBFou0HHIiaHXuzZcTUMifAQSS/+vLrPBxEWSG6MPbXdr2Fz7GxhdNMvCL5T4Xex4S
	7Hq3d2aAmfhedYsPVk/R4VE0z1l+C5wIkr6zdwJA2k8h7qV2X3lVpEVKe27EESnAXslkq1+S/Uc
	Z+tkvIlkleJ9sDWRDbjiyzosGt/x2tIsizYEq7u71ve9sX0REUZPaw2aiFdqxuRsHyCGYBxImmJ
	Ma7smAT5Fs66LlEFlRKzyzOQL1T4pgyLSoRFYjtdzBEqw3xA9c1bKbHPMUW8oqjIyPAi0wYKspw
	ozI8X4A4m8LIO0hYM80E4jh4PEccwrj7v9tBb5vlBfW5yZr0T5hQ30IxkbmYLPodXzRor/6Il05
	C4xx/bvdBTHaUSiE=
X-Received: by 2002:a05:620a:4414:b0:93e:c12c:f13c with SMTP id af79cd13be357-93ec12d0615mr322004085a.70.1791568624478;
        Fri, 09 Oct 2026 10:57:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4414:b0:93e:c12c:f13c with SMTP id af79cd13be357-93ec12d0615mr322000385a.70.1791568623867;
        Fri, 09 Oct 2026 10:57:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm108846795e9.8.2026.10.09.10.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:57:03 -0700 (PDT)
Date: Fri, 9 Oct 2026 20:57:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Message-ID: <nolnhsbkk5w2djtvzzxkcq6lrb5xixlpk4elhk53uccgjyt36u@hnpu7gxzoy4n>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MSBTYWx0ZWRfX1HkXB4grXExV
 z3S74XtYEU9J+mSq+/cRXixtA6vmF2BpZQMAnkBtejCMCrJL9Xv1D3NmL7JlrHnHEZ9h9qw22fX
 eq8ezR4BF8WedNRADHk7sP6+ZfCFPgotgaVBt5I5tlxB9oUugCocSUkuVWQEB/iBr8EI7hNE3sM
 8OKhJ4Udar3449t8vzZJ0bOHHocGjNZiSD0ZMZUSv+FyaCsQ9qw78+xZhROC/mbvTTV3ikS2Ega
 8mvBCmn3hc1YE6Iz1/LZXZpCotFd7QUJ2QuegGnf8dwJGDob/tiCIOWDEoCXi48WFdglPRjnH95
 /GTLd00ALTj+u3wyuqz2ibrqB18UtIZO3KnbbN79uHALbxwk3SrdtuA0yv3JXrO1QHvz4Ywgsgq
 TYaQ7QuSPdljt4qIkclUFinTyCWYfRrlH7rJZjS+zvhHHfkeo3NzS7VnZhZm0K7MWpX6StZ9OuQ
 VE7pC4MrKPIf4qEZs7w==
X-Proofpoint-ORIG-GUID: C7ykVlrSEMNFp3XFZUykR72P58GJJ2Nv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MSBTYWx0ZWRfX3BsgddUmJmGv
 clrtxUOIv93Roh13ZmEPOsBz4ab4C/8ypX+bMQPhLB8hd7fYsEn7+BY2LXrj6jl9zEbz9OaHyv1
 a2j92A/QmYJdc2oYS3D/hzFxvsKxpUQ=
X-Authority-Analysis: v=2.4 cv=PaFqFShd c=1 sm=1 tr=0 ts=6ac92af1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: C7ykVlrSEMNFp3XFZUykR72P58GJJ2Nv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090071

On 26-10-08 16:10:34, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node passes only the first two.
> 
> Pass the board sleep clock as the third input. No functional change,
> the video sleep clock keeps the rate left by the bootloader and has no
> rate consumer.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
