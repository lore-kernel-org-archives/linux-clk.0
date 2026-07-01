Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91ED42B751
	for <linux-clk@vger.kernel.org>; Wed,  1 Jul 2026 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912126; cv=none; b=hzQStstWVM/hyWPRCo7m2mmqVetBVK4/PfYyvKuPOG4HoFp09W8vWTwafBueC1ERdDfD2KA0T2Z3lygzv81WPOwItsf7+cpme65mRkfLc0i5z3u+XZJt9q3q25xomqIhiN7YPE+BYJybCM39hGJXD9fgA7+mg2ZVo9YZo4jrFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912126; c=relaxed/simple;
	bh=imUYo300ApW9+d4uFzn0MvuMBA15s6GsjOB9vKaypgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TRisqRO7SRzTH9mA+sDehs/VudvaYZ/AFGdx9HKej9bpRJEVa+RuXE12hNqvoJgdmz6YQDsKtl//AW0vZyz8SPuimSoYvm4kTZSBPJH+Q2JtIHrVWLMPe49A1z/k5T+PVoLwUJWjTxqdBYxeQUEOMT5nub1WY45c7QoJzvpH0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT6eI/e5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hm1/60bm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PT6eI/e5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hm1/60bm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A90Z8763116
	for <linux-clk@vger.kernel.org>; Wed, 1 Jul 2026 13:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	323+8Lo9ghlx0OGQxYVl+sZMRdS8gaUESvkTn31utjQ=; b=PT6eI/e5XC3Vp+2L
	u72/5Hg9ONZgRtEGOgS2NqthBrvy+0pT8hADKp49sRvtfvoc+G69iQHTMEhyhBEt
	ZLjXkMqLDjURVp2PfLKH09eNBt8SneTzD6uWVkFH3n8sdZp3H8V3OQorqgIi1X1H
	Ur0MfOjpN5ZPjgTMmbb5xFe/gwvPk6gPmLWE0JM5eU1R1nz8kfW2+gznY7BE2GFL
	tjcbVWk/4pCGcKjVfklbTMPNxpdICaEk1STSzx3Ivd6xRf8SE6oRrrlbkjTjxmL2
	4bpxjKr2/dFF8KQZ8XpW8QqGIB5taBFFhNO6Mvz3Xczr3u31FYA3lSXDSpFLxDqn
	ImNjPA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jktcbqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 13:22:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-734f7d8bb37so42580137.3
        for <linux-clk@vger.kernel.org>; Wed, 01 Jul 2026 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912123; x=1783516923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=323+8Lo9ghlx0OGQxYVl+sZMRdS8gaUESvkTn31utjQ=;
        b=Hm1/60bmq4wQfX1QHE6HC7YtdigXG/0gTxJPO7idh4v7dc7PgLBGIil9IQ/BQxhf/d
         jhrMLQz6g7ce6oNITR7vU+DwEK6RBiejmvN2XpcTuc674VTLIz84zFR4OlD8o4JE3mwP
         y7WKK/myZZRvfL/11iRGtmnhIslEh97Gt0mGzfDVnyvK2Am3Ym3ljTJs2lFPcuCxb4nR
         DrKKBYEfFGqI4hoddtQJ9gr4SQWbv7O+yre1Yry3uCRqGm40H6QgCKuN9+mN58csAAHy
         Kk5+3ndYjRmaHMQsWuVjZbTwya44Jy0D2IoZcT5UumFNL1QGJvUcVohZNFkKemfx2NtD
         +EHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912123; x=1783516923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=323+8Lo9ghlx0OGQxYVl+sZMRdS8gaUESvkTn31utjQ=;
        b=Nb6LbhAwW2F5rlZqgUBYT90Wj0Mg+wYrTUNuCRnWS/xToibWdUUh4HdgZYO5iy8I3N
         1yfhMRtyfE+vyvBVgXuhZu2xurAGiORY3YEXRDy7cVl+CIcAb0vGM+Sp4/YVrwvv7oSz
         T6HKgsH4TFDRt3C2QfIfccPQ+qNgfrJR6RdF6adSGwiNoSh0BjJZ83CJTFgTL2YwV3jp
         B7JdCaaFP4SXVApGqzsCC64wDDg5nF1lVcLn44mt0oELaUArSD8lMuqg1NRqdn8LbRkn
         ruKf1bdtRcJ2Xg7o2/qTwWVsajy9bExFhvCas0hX5KTnKEVzauNbyO+RAAGSQyKD2wv3
         8pvg==
X-Forwarded-Encrypted: i=1; AHgh+RqGDuek10yBoZTbhJuGvmNMCnHwq9i1FFRg2BSdj7qpCET2hDeL6jAH/G0zS/aTGB7KGfQsYosAlQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE643kA+wx+i23FI6bxwlka6dTdoHTpznZELTvlrPE8tXaTW3b
	XoYzg1RjeQBpiewPlg4SeYXYAtYG4T8aNgWg8619M6CNMCZSGfXNm/0ERn09CBf8F7XvcvWhfpM
	J/mX3gav4+/uIIoz/BBbsWUf9noc3jKMTOAl03V/Sbpy4SKHHeycLst5fKr72hj4=
X-Gm-Gg: AfdE7cncUEPB4zq19Ywo7SVnS3EoUUKd6bWtxbapkc4KIwe2eSaYdUzGWVoVX0pQkP+
	eMEruXpgUF4wLhhqb6cUXImICvrCXu+XmgWa5Pp0QBVAPnjO3NE0WV/tViuiWqnrt4dW57GeV3f
	IcOvOSdo5kntSTMtVTrZ1hzmfsn7QxFmx9nyvEH1E7Fl7bMW1pD7VTIvhU2HWR6UumuSMOhMaug
	Y4djv18YVLlYUV70FwoTVdZktoU/UYbTPfG4JNUR0aMw/a4RC1p6QpvMEfpksfa/EO62m56Mp7X
	9f2Z/Z6H66cUybNKCShXewmr9DQDdY1bciy5+NfVZMRDdDzj90oTQAkaGm1B/JesMYWm5dQTFAI
	8Idvk1iEbTq/HQzsK1aWHBtd6jVqIm2p+kFg=
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr199502137.4.1782912123370;
        Wed, 01 Jul 2026 06:22:03 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr199495137.4.1782912122983;
        Wed, 01 Jul 2026 06:22:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288dbf4b4sm274203066b.28.2026.07.01.06.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:22:02 -0700 (PDT)
Message-ID: <e232f53c-e610-4c73-b1f4-2015f50569fc@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:21:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled
 via critical CBCR
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-2-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-2-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX/yxmJ9mb7fzR
 lP+pJSV9Men/WxqslTOOEZzvCVq/vpXS7jGkssyGJFD9cD4C8rKF4Bxu4Xdv5LsvAFNr2AaOyV/
 15k+yQuH632/31yITZwAO1nW3J6IxeU=
X-Proofpoint-GUID: _opdy_s4zJaFaJVfYxxzowisf2MM04nx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX1dJP3LZBBbyN
 0XE9ufnSt5h6dfRxNWOWyRgADO5NcM9kzA1BQH/qRsW4Q+hEPg7WPN7hb32eAYEg7E4KyaOxROy
 lSyqNvUqFHc3s9GozA7kmNP6xsmsqSRK03197qM29q17gRWqA2oCwffrrxrr2d3tZgBRGOofolL
 Zwj0y1VOkZ9x/OafnEHJ73H+x6ruLHrReQ/PX0uOuQY/LtyZ9uzqw3tlLeElhTX3Nauekf8a7eG
 LPDdUJoU5cdN0ntYTr+Ety+CCbUzmLkvwaMb1/vAuoUaVfJ1DBjwPyH1wiv+ZmoaPQAHlBMffSb
 TNuisXIrx8Mi2hdFPogmtpobKBX7UAjsWhZUj8n4/tY0Ll7pv3cEPIevJBFVPjMK5QZcpDAmChn
 uX95JkiZF+ZMBLeVtCCNcuc/CJMRGbHdhjoBWiCB2wey25gEpf2BCukdapkIaXUoauYb7MdqFkZ
 WyKSRBkuRXFdtg8Kbxw==
X-Authority-Analysis: v=2.4 cv=R+wz39RX c=1 sm=1 tr=0 ts=6a45147b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=hEmD_o_XFUzyhzP6z_0A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: _opdy_s4zJaFaJVfYxxzowisf2MM04nx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010138

On 6/23/26 12:54 PM, Taniya Das wrote:
> The GPU2 CFG clock must remain enabled for correct operation and
> should not be exposed as a controllable clk_branch.
> 
> Remove the clk_branch and mark its CBCR as critical instead to
> prevent unintended gating. This follows the same approach as
> 'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
> Qualcomm CC drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
