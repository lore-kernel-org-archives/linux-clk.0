Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BB436921F
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517396; cv=none; b=Hp5v1y1nAAu9AeZO11hMY88X0udwYwdToBPx7DJuyWTSpf9giP2wpmuMkWhDYOxMi2OV/Daor/m39dAyCS6+0oC9bHMo3lAdj1A7UD9V8ol3rHsVP+scANTb76q9+7tb1MSeazHx5PJyWLd7PGAUgK5qXgCcHfqEaFheQLRqBT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517396; c=relaxed/simple;
	bh=OEtA4jyMZvL9PeaZrYIy2+s4yVitbGhdxbY2yo6rOmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DfiRbJYedEr/ukKpXTzCbIclPeEI3wx2CYFnPIfSolZMln6xOZ8YC8eXwh4u2H6XCabDBtjDENnzx7kX726Id9zKIPzjqCuY/rzY/F25zi2/Der0fNzomxUZgSPIm0nvcvx/tBfYao+S7uD6wT/ctTK6ClTrS3iaBYcO+1sDmLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jeudyJRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2Ppfx1s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jeudyJRk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2Ppfx1s"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8Rt583957917
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=; b=jeudyJRkSOQY19x2
	scimtqrtUx79HPyLXNhLQaaP5m93jInrdrxg300dv0at+Og6AeKLaDOWe64O/WXA
	6uJER2RJkChjIRxTHyN8t5D7xgagPTBW4JpeA8Xvfc/qaHUeiNcXqd4jyeZ8tRoW
	eHS7E4hKgFUCXVAjZoO66sZRwu2zjZ9RuJ0F8YAZiY2kXMsz1MlzyTurBkOcVkHo
	yfXxLmRzweQiOyyz4nkTmIMg+27ej6Bx62ku8sFQ3ECnLFjXrCt2oDIgc3UkEKHP
	WQzp+tUGABYHDxAlNWxab/9eVMHEtPFbArsUHsKB5BDgZWfisC7d67h0EO/l/EKd
	wg5jQQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjahj64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 09:29:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b2955cc1eso2235881cf.2
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2026 02:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517393; x=1775122193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=;
        b=J2Ppfx1s+ssL1DErG3AOxOYcGDilEV+Nw6mEw5wpO5sr82ZjTTRloELL+VUMyMbYY4
         Lpow469U2vOUB+wDyCqPKr94aiJMIds3CV4cvsDgiagrnd+SMbQoJpSFws0VOpqqoMEh
         2MknHw+EHc49LC97gXLFDk8XKqJaUvn50S6FPUyacmirZpVd3TUJHkfgxRQqB8z+HkOO
         e7YNQmD+4sin9q4PZF0YLchYSJH6sDadPN3l9eBTustuyCmUFSASU4M9S2T4efNKzfVD
         5ClvYh03kao5I8xoVkjjKUooo6cXdKPwBqvCDNpDgDsLi35jgBlsiaIEDz4kws3syBSM
         DOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517393; x=1775122193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gH/nLTW30l1t1AMZDWjlv2ErkD37N2Jw351X4LtQoc=;
        b=EPuCF128df6vmTg7xwhHkoejcGeLBDujTQlFUpbba/nkucXiUUK94CjJZrR7qZvRTt
         LWG5y3XljCv68b6E/5q71v6J3N47sO/bLreWlUKN3+dFt8inBQXdREqeBXuiPiNdYgwD
         pO+SZXLwRdkxxN+1lRICOf5ge3wQhqwhGx0DctXe2xDibNPzsuRDEXEZ4EOfFEQS9Uhw
         oH6wVsbGjY85S9i2SK/hr7lylKx76k/zHeRchgkJ+zBSUaONtp9IXV7sJKTWLLJgsANN
         4TSjghyGTh+0BKfsz7kfmiP+zhpW2huboDbInpNU/Lw6b9CpllXd13jmCMyzP5KikiK4
         40Hw==
X-Forwarded-Encrypted: i=1; AJvYcCW0maMcmT61KVNS8vkPLkn9hYkmD6iDyphlYJQwMIoFA2iixOTj2RkfX7zBeQLy1WbGYJNMs5iyJ9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt1uSvoKiCmV5vxv2MVS4+Zhe53O1SgZHl6oDSRcpgPxFMxVxY
	tVL7xRVt9NyDiK87itKlH0MA4lhxrhDpfmgFZgLdM/e4+dFmcvrPV2uX4kG0ujhv6aCPeu6pQa+
	XXiS8i8VpuEiP2V3BIGNaPkMxWbGXwGIlPEmMLF91/rD4b6qcYdXMoB1ckbTrZU8=
X-Gm-Gg: ATEYQzwzGyuuir7gVQmNpViPgaD5/vAEXE1Ng+scgqjwQZ0BoCMiXqvBxFPUCkVjPbE
	TFc86EdXM0GMxbekeVebZePp1MlyBU8x5XCgZMls5FVIEd7I3Ebgrh5cRprRnDw+/KssmJ4NZUW
	yntbvMFcswi/ZVVlu9Sroj4A4k+3ILfE5vUoaQ1L/Db4vknnOVONmjwF4Ddws6mZOrJnk+3vYqv
	o1yCmX0TVHSc5cAy9jfa8WvPYwMcozcQgbt/y8H+IuSc0AFjq+GMj/L1hpYuaHYN4KmeOAnz1/6
	5TJIE96ej0b0zYdy38aiynUpKtlTDbi+DX2lzDdj6rlkrvx9HiD20TR1JMIzwZ5kG7aZTyknkHp
	C+cGZmz6kLNxXtHL2gppY0Hyl16LeWL4WqGgApDvegjnUEr3nkGwO4S94ApqeLFCV6yIFTynA91
	ICKZg=
X-Received: by 2002:a05:622a:848f:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b80f42a88mr55691391cf.9.1774517393512;
        Thu, 26 Mar 2026 02:29:53 -0700 (PDT)
X-Received: by 2002:a05:622a:848f:b0:50b:5075:5256 with SMTP id d75a77b69052e-50b80f42a88mr55691281cf.9.1774517393028;
        Thu, 26 Mar 2026 02:29:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef86csm92027866b.49.2026.03.26.02.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:29:52 -0700 (PDT)
Message-ID: <dd71e35d-5dd1-4341-bcdb-d082dba41d3a@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:29:49 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -TRXeOqkSUJ_dmz_SUx4fW5n0Kcj42Uh
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c4fc92 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=RfqWXZ9bYgCeT7nH-EAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: -TRXeOqkSUJ_dmz_SUx4fW5n0Kcj42Uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX1UEdxAkvErog
 4PhazphZwgfjbQC1ztagyKblu8pg7CPBNG0TfH4gePVfVdbfXVHi5Ws55QX1laYyG0U2FioyNp1
 rQu/8jAYk3d1nn7jxp9wkR3cESAR/SmxdNwEDVEpSryhd6WVxLTPBQE1N4yD63S1Hfnu0bJNMEk
 lZdmAzXKDsLtfkJJ6V1wuMIGarBXI9P7uMW87I6/9Qjy9JOAptwDAafq+4q1kbdHuu07UPbGqjZ
 vaC4yyx5RhZOiuGpQj4maXqBrWUoMlvqM/hA2Lpi70FDGuYn/XT2+ZCHmeCt+nsSo9oLimGCQhy
 d0bedcXBcc2+7TbwRsIlz3ZhUHo4gqYkOHdUnaE6s1AyECdKMHxvfvJmD44tJvBEUTflmutClb/
 Z7jRocpxwt85OjuY5+7ocomXBDpGRk8V95rS4sK1v73V0TuNc1ZQDTl/BMXQ72GB4Pr5Ka/VN+J
 +9nEoX3wh4RtAbOqP8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> The IR transmitting LED is connected to SPI8 controller.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

[...]

> +&spi8 {
> +	status = "okay";
> +
> +	irled@1 {
> +		compatible = "ir-spi-led";
> +		reg = <1>;
> +
> +		duty-cycle = /bits/ 8 <30>;
> +		spi-max-frequency = <1000000>;

I see the binding allows a power-supply handle - do you need one?

Konrad
