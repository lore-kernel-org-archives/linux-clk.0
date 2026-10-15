Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D716F509F10
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061080; cv=none; b=e5rqXwo+7fTY/6gi9s1Xm3IHSCaXobpCYTvjGfnIS/lsVxUH/co6vqcOTR4IyqK2OTxPOzbxcea3IOKkLmTfq9YtwSLYjGjMTM2U154A9e61sC1QsgLue1Sm+OR3UJddDgDdHqkotQWZbGfNRZHQJkhvm2LFAAvOu3ZP09Xa2SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061080; c=relaxed/simple;
	bh=pjmB0KZlmblBqUhkEx3AkMCixjS/J+z8FmoDfp/UB8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTd3c8n7FlaMebZpR0HDPuR9VW+VoLvovWQqQ+nouIMZgjO+KGhTHYRZyfhO1RcUIdFevulg+dvCttjp+HCtzvFFKNcK8T8PuIDOiVBiraohRmr2hyXHc1F5PzJkIsTmDM1hRzsTUIpF1NcaaduYjPZesSiy65xS4GquMIlV3bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chKRnG5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8VgVAlM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chKRnG5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8VgVAlM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPwj41596384
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=; b=chKRnG5ZAvs4UbHN
	fE7gXArvvnJfVCAcXdqPVAkqozgTYu/5pTFUljvjqq5YU1qfakhtvue7QSD9Wt/m
	uyxtUGXIXgBV+p+7rX06Ax3S0L+X9iD0pIhrPt9dLcL4GgpnzwMhBvEZOnnP6tGj
	8uzSNNbcM8+qCn92LMrFzVfmXjPSrjPq2db1e2+BYWWupH0MmJLWVN6mW1XFSo+b
	E5PPL6wqiIAwrx8F5foxc6S6mR6bYVeZrXML5AZAENh9osUHzCqdVK3x1C/yyWLg
	BWR7dmD88bRwxYZOXEfXII012rP2icJ4glvo8/LvhBFEXBKV/6TwcJWeHB6LeeBK
	NsqG0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v824t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso8127741eec.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 03:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061076; x=1792665876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=;
        b=F8VgVAlMkA9XSY4Tm5bI4sKJmmebfslRPddRI9n2LoPD1tceawlRNyggpMN60QjhKC
         CGMhHw9UKd28U9hmAR4W81zu/47KNWCSo9OgPRxmpO0HtXTA8CTsbCeR159FixulhXPX
         qzMOUlBbW0C0yLFQ2/HC/uJuTf6hHs0TXpTX6mUM0QAylKbmWmFMjzKods9aAo90TNlf
         IObuNmMNYGhrXvpG0XNPzr+cEQGjFaCtZKyzK/xOC0/qMWBhlc3ro+kuWXYuQcJcZp6F
         fgP44m4k3FQPJqP/HtQV2z3ssn7/1ISI7aOk5iiQWWwBKvSYemRlP+IJspik9/rICeI8
         MD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061076; x=1792665876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=;
        b=CX0Nghzs4WnQ7VQe9jSpInegTABh3POQe36LT2588ZTDVAkEy7LJ11Keq6jqKpiFfz
         OQKmVbtOFlcubjSqVCnpG9Uzv+0Ts16HYvQkPO8YYSsPgN2wBiNZ98c8sh5J932TqO7p
         evRdKLm8OhN4HS5abDlt6kdQragzagjijfwb4Y6hU3S6QGI9EUT9DlaauyG0gegQOtSY
         1CeuVqmRkNtiDMLOgPo/yTuWVaYfcPh4lwUBwfm/MpaDX7uvcZC2sb4lZqbU/BFXmd77
         xvHT0FE22zRlBIfaFZMOS8NjFDhzbq0dfU6szh53N4hjtnBFG6WDbR0dHeXbwIZOF6uO
         qcQA==
X-Forwarded-Encrypted: i=1; AKwUvBzxjclCkDNu07j6gCnIgP9FBRKPXte3X/zlTSOnM95HnUWjkQsyTqyDefo8cUAUhobJ2R5QSMMxrZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPR3GGLwUOnl2f5uOPUo/QFosRJLcRfSuxZsjqI5a0UhsCjd3t
	YKGDy5DWeYY8ijGLbl4P8T3cqCaRjJBJ2f6YFtf8WdXm9oqIxOG+8nVVYm6CEwSVYX1OyxGOS+d
	6jrUA3NqQ01r2M3+gwqqRyq/i7IXMNofB2SDKLhxg0WJfnYV4f1a3v1pj5i+X3GU=
X-Gm-Gg: AYBFou1B/5Tf2ezOQCCzMcco8SYDqcj7K5dvoGAb2eoZbTlc7cQt/0uVVb+nFItlzPy
	IcAKkNwHnzU8Ea7mRd6J+6vEPFAY+gnIEiJwBilhKzkfaegqQicTVIM5H9K0Pa52jWYXNhSfixk
	HHhIGl/GhPZ52uawGgKrOuXDiQuP/ibMlo+uhtTSQLdv2sd5KjS6Ny7Ni4llT79jupAfp98IWsL
	+9Y/VE4ACLu2Hk3HJkilN+PN0DwIFGOBi+EEnr2BjjSDZITkaRjphrA4yE1raesOVRv6Qhgo7QI
	lg4F/H7ErDgyzZ2D+y4NnK32I/mqwy/2JVz9iD+QKmw0KdDO82LtFN+9uV/GuSf9zjSMjNCfkvf
	fS4p4hidCp1Cvxye50+7zEbSGiCc=
X-Received: by 2002:a05:7301:e0c5:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-3590f090316mr19299380eec.11.1792061076283;
        Thu, 15 Oct 2026 03:44:36 -0700 (PDT)
X-Received: by 2002:a05:7301:e0c5:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-3590f090316mr19299334eec.11.1792061075690;
        Thu, 15 Oct 2026 03:44:35 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm26096247eec.23.2026.10.15.03.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:44:35 -0700 (PDT)
Message-ID: <e65dc4cc-b080-4af7-a443-d837fa596adf@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:14:28 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
 <DJ3HJRYX3CJG.JURHJ0YAMA4W@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <DJ3HJRYX3CJG.JURHJ0YAMA4W@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfXwvnHMInQdyVi
 Vfzzdqh4V//KWRTF06kKOD9HhxPEIQCQ3WJRDwX4joA7E1hH9tVQsivcia1wc8/PLbdZ89G1MNm
 fXrlBE6OUUURmX6NnxVLw/Gghw831k2l2XcAniQhqWw2fr4TnIl5TqEeJk5kYDVgo6DeWIOGcAv
 b+BGmUk3Pknnq8qdNNovQM5ZTYqExGIT7zmliEtvmSsMXcTOy6BuJy/fopeA2XNjZDx9IQp0PPj
 Ud+894bR8oIMjJup5scl1KO1UEHXHvf3rnyqheTOx4+N6CzpyKuCoYI9pCzP0q4244d3ArPwahI
 wkL57tdTayRg+l57+gNIDHmArz5RfEnPp3AWvvNK0X8kSbRPB12HIP7wbwCAcgv7UgOZkjn+TEQ
 0B76L9xx847Amzg7NJy5a5FwQtj6sr6p07QtXz0ka/s1v0IeJKprzJQo0Jf0k05VzXfB5d8+5R6
 1Vc9YN60t+p+GSIrHKQ==
X-Proofpoint-ORIG-GUID: qGUoQsrfAlKZFY5-EBO53Q9vlGH0yTV5
X-Proofpoint-GUID: qGUoQsrfAlKZFY5-EBO53Q9vlGH0yTV5
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0ae95 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Yqn-oMa6LnlrTNRXoS0A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfXyOHS3oVE6fuf
 skZHB11dTy0JjDetAQRjf7lhOQh6qG/9MVlZZW7GwK0vdNxfdRsrxbY76piouRDFF36BgthFEVM
 defZ3fDjcHkPWRldTamMppX2yY4IkQA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042



On 6/8/2026 12:52 PM, Luca Weiss wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..1ff9e1598d00429c03b2bcae41fa370ab2c892bd 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -5908,6 +5908,13 @@ edp_hot_plug_det: edp-hot-plug-det-state {
>>  				function = "edp_hot";
>>  			};
>>  
>> +			gp_mn_active: gp_mn_active-state {
>> +				pins = "gpio35";
> gpio60?
> 
> I still find it incredible that the QCM6490 datasheet (80-20659-1 Rev.
> AJ) doesn't even mention this functionality on GPIO_60.. I wonder what
> else is hidden on these SoCs.


Thanks Luca, my bad will update this in the next patch.

-- 
Thanks,
Taniya Das

