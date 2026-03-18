Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CED3793BA
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839587; cv=none; b=sAhtEh36ZEVDGqqWZDDB0VHjgMVJLSeDVmw0f9AKD7JN4wCuezDEnXmTVKUd8ZJsAywD+Af6cFKJBIRmvVXx0HDGLOFhkAKZos+2ACV0xH0bMJbz/gEZxcTsQV5sghJBniDO+5QlXcOM0xpEPTKx0tt6pP0cZNJws9BnVaD1GD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839587; c=relaxed/simple;
	bh=+L9vOqSjiO9a6O165CuZxAw6NKrb8imiDto6ttLiloo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoUu4k8Jc04TplVu9Qeqqf1Nxlhq2tK9hGoSUkf7Vyz9sWFNsMsfB1WMsIvRTtBgibtjFUy3GE7Tlpqf5YvS8B2AwI7POCmLArstolc71peDvzhXT2eEhY/29CXjO8mmnSbYkNY2ScsK61WvYsK9ApSO98o+5KAzEIe4ovuoSoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jz3XS10m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGdm771G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jz3XS10m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGdm771G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IAhxBC008446
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E59iGtHoJttmNzitX+WU26YIvATCm8nHOcVB6LcRIhs=; b=Jz3XS10mK5iWpAMH
	IZOP/Ga9BaythitcXHYA3vN0cyT1r2vfujIy5BPUxHtRuFWfr6ffG0l2k4DOLCY1
	ZWjTGIrIQd75Kq6VlUln45zEZwsuJ7KDKmOteYAn30JGFOJUVGLaMebWdeBRknmr
	Dimqnhhht2vownssAYk5s6br/zRCWqURZY8nS6QxRJVMgnwIi6V7liAY4J6oqPc0
	/aMD9LIGihe1eNN7qRTJg+PUl+0wVv3+YulN16ZaDlTgFOJWgYKb+X26qPN7W2Od
	TVmxKbSfbrnA0CiBuG+iwZqaIrjJUJtDks/tjO0Ka5e/vA70eOxM2NT62/d8zYW9
	oVATFg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj50g53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 13:13:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b06395b8deso29623035ad.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773839584; x=1774444384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E59iGtHoJttmNzitX+WU26YIvATCm8nHOcVB6LcRIhs=;
        b=kGdm771GAL1UMY1qjIKsg3GRCV22r1rAfOLE3r2RthxgTUjbTWQrIB0kE/2DaCXMTs
         xu2Uhwn3+QkMNL0aDj0GvJnPardbnwOdEfv1hCaD8CIXx6KHrHInE4ynsm47hPv4kICp
         fXle0+Klzp0T8TuL4gzh55TUmYh2oPEaFlgCsbXOeddb6mtVtUzeBZQlFenpbA9goJuc
         uXIv2hFbR1hBXc88JeXIcO+GoF1B7ZfieWIjr+IxqveXRtugvYNbggr372n5nGsTNtj1
         E2t/fJkcAEn4CGkxiFnTFjpqsIdPZGB0LLfM7z26e4rLcFhAPv2VW3GodSqvh7mtjcL1
         xZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773839584; x=1774444384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E59iGtHoJttmNzitX+WU26YIvATCm8nHOcVB6LcRIhs=;
        b=FEuEuajD77Uomc3d5u8OFcJa6k855UOcigWyaVMsezhIVsKteR5komZ0BRE551Oh6o
         oQV0vTKcCU9nTXZxuCsTM+O/cJkOmaZsNWbfp2E7CtnW8PJoqUUGh7VlH8NhdPKENlcK
         bWK5SkIkE7xgWWeyFBIp29wX3v6QR6ppy0Xzb0AD8uVJBeu4oF3AkX1eA+JnjxKVKChF
         /4zslh+GZTc730aockyvCnHkcQP62jBKSWuwBVv9ss8P05h4V974lUYHbgS8X8DwfLD6
         DO1JQf0THFUZmgfY00YLusIyaCdGDk5wi8RGOn/1/C2sXE6kkUboy2Nv1iXcAl8FeNE6
         JnFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcX1RKdMKvYcv7yJI/T7rvau3nN18GjxrjoSUpu9YCA49ScE0wYj+uSRa7RGdgIbbkrvgvFmpHHEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2dXqV+7vicIrGEFZiEQNBuSqCoEVoUVy9smbcIhhx1XMQaPFJ
	8D8XC5MzuXHhpR8aWQJ3qAcqm2xzax1E2kqdTSEHC7zZJjECbtnswTZQkIT6foemzQllFZN+1H8
	f+CEYIxJaM9SIUUyVZkameCz6DPiDUk1mBY3mKaH3abqfEQy9GmsXyisWNi9obqc=
X-Gm-Gg: ATEYQzyUfaHM3CxDTA+e8ypjH3OLYGR2R+URez+qJSUamZjRfP8IPz3vsyMnOCkVU6y
	aiQzYV4bLveiBKhXL//ygDnVA+gz0fchyfZMYH7Yit3JaScgYV6Ku8h8nWcKG7JsQU6mRX6ap/0
	ZHC33BhundU9ATDqbPMllpnpiLGouDxU6MPcLSt9h8VZDvkAFFkQAI4xu9VIG29e2e+i2kXUo9G
	6++3/7TulTAYnyunvfNKZMmOXwWi7OeNp/d76I8UnWA8MiFp1Q+S6KfVMuM2VGKT5juELuH4Apd
	o59q7b6sXUdOVjxuYGsYCTshz3F86pRop1WJ7eG7oRXgjJO6Td62LJps4pleSUmo+emx/vL2KRT
	1tP/5FKsTxKzRd2fFNvEnt6dh/aMuMFdjCprnUbn8I9MBArFh2lizTCgOqXUSJTSAFA==
X-Received: by 2002:a17:903:2f87:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b06e35b4c7mr33140755ad.23.1773839584305;
        Wed, 18 Mar 2026 06:13:04 -0700 (PDT)
X-Received: by 2002:a17:903:2f87:b0:2b0:41bf:ca83 with SMTP id d9443c01a7336-2b06e35b4c7mr33140445ad.23.1773839583794;
        Wed, 18 Mar 2026 06:13:03 -0700 (PDT)
Received: from [192.168.1.28] ([122.164.82.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e44a258sm27444125ad.34.2026.03.18.06.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 06:13:03 -0700 (PDT)
Message-ID: <11471fb9-a862-41b9-95d1-68ddcca5b7a3@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 18:42:55 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: add IPQ5210 SoC and rdp504 board
 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260318-ipq5210_boot_to_shell-v2-0-a87e27c37070@oss.qualcomm.com>
 <20260318-ipq5210_boot_to_shell-v2-5-a87e27c37070@oss.qualcomm.com>
 <c0effabb-3daa-4752-9069-c49a562edc63@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <c0effabb-3daa-4752-9069-c49a562edc63@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDExMiBTYWx0ZWRfX69mr7MKNx3L9
 KkHvZ9gfLNrUwfEisK4ViwxM+1Yxncb6YKHtklGmJpZeK1oHKBOPqPCft2jGb7Qr7Q8fhl/wzTn
 Gk5D9T3m92GkX80NIcUb8WGnuC9ngU+/ofAlHeBZOApguFSDv1zSOIuO9xoQ6bzA1JTLT9Ni5Pa
 w4n2Wia+fl7LTdkYZiqBaZG+PO1v6nYe7puu0MxG3f108RKkfRyV7Yq2VJPznSNTsTgP3zH69zX
 ee7nlSqoxKmOyFsc0Rzqs1tGcNSTDNyzpMUZyKkgLfmajwWpNHJ5KyfuyIa2iewV9olhwMDLBuw
 vYK2xxXHiQadeBYQZUlW1d8XG9Bl2AsmQAuGDogpAIVuh18FVuw4QNrF5GlhwpNlo6VKrTA0EA5
 4f8ZqOiimHQyMBA8Uk0MCYlH1QeHHNb4ARYZTfDakc/beIZ3tpaE/cOtkFHOyGDAMAtL4PoyMeO
 xVsJTWgy59AEVx93/PQ==
X-Proofpoint-ORIG-GUID: CJD7En6yPWhEM4pbwSpVaxn9nsW90Zpl
X-Proofpoint-GUID: CJD7En6yPWhEM4pbwSpVaxn9nsW90Zpl
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69baa4e1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=x8XZtM9IcEPKAfKvXv8PGA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=onala_4StLzjsFYz-ZEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180112


On 3/18/2026 5:14 PM, Konrad Dybcio wrote:
> On 3/18/26 9:39 AM, Kathiravan Thirumoorthy wrote:
>> Add initial device tree support for the Qualcomm IPQ5210 SoC and
>> rdp504 board.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
> [...]
>
>> +&sdhc {
>> +	max-frequency = <192000000>;
>> +	bus-width = <4>;
>> +	mmc-ddr-1_8v;
>> +	mmc-hs200-1_8v;
>> +	pinctrl-0 = <&sdhc_default_state>;
>> +	pinctrl-names = "default";
>> +	status = "okay";
> nit: Please keep a uniform \n before 'status', file-wide

Ack. I missed this to take care in RDP DTS.

>
> [...]
>
>> +	cpus {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "arm,cortex-a53";
>> +			reg = <0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&l2_0>;
> Since we have PSCI, is there some sort of cpuidle?

Yeah, there is a plan to support but it is under development. Once it is 
available and validate, I will submit the incremental patches.

>
> [...]
>
>> +		intc: interrupt-controller@b000000 {
>> +			compatible = "qcom,msm-qgic2";
>> +			interrupt-controller;
>> +			#interrupt-cells = <3>;
>> +			reg = <0x0 0xb000000 0x0 0x1000>,  /* GICD */
>> +			      <0x0 0xb002000 0x0 0x1000>,  /* GICC */
>> +			      <0x0 0xb001000 0x0 0x1000>,  /* GICH */
>> +			      <0x0 0xb004000 0x0 0x1000>;  /* GICV */
> let's drop these comments

Ack.

>
> [...]
>
>> +		timer@b120000 {
>> +			compatible = "arm,armv7-timer-mem";
>> +			reg = <0x0 0xb120000 0x0 0x1000>;
> Please pad the address part of reg with leading zeroes to 8 hex digits
> (i.e. 0x0b120000 etc.)

Ack. Will take care of this next spin

>
> otherwise I think lgtm

Thanks!

>
> Konrad
