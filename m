Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6C3911AB
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820947; cv=none; b=iFNZrsZB75z7RlM2EVsz7jiiT9+3Ioqj7JSxVAIWK06/AnRU2zC2dk2nDfdTLuINQQ8Q9SlCFasetKCUefZqVftQOTnTQohRDY3NDTieORiab0sf2xxV7uwDPkDuDOUp+Ft9ODN6mdZ8yzzgwRE4mO9RgOmcgRu/W1zRXkxSbhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820947; c=relaxed/simple;
	bh=8CAIVnvJ/rPVzHy5yeUahkVZQrOPcNAKX1mzVBJ3LXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6Bck7vlqyCDnfB3Fhfl3inV9qiZnXDKToP5WGTkakwlw2fggZNkEN0wCp22lCByqPeFmZU/+gnfYoX+++wuRNQnYcIP8AMk97pGa/m++jRElibH0eAItXJSt+ZXM13kfKZiKiHONFiD0PAA0HlLjOTj4d0AnejhXa5tl+V2ANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gr0FKQ3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUjvswAN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gr0FKQ3D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUjvswAN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFeqZt3782700
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 16:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgG1CUCMKjXxg1i7tGQjclcS+aKmUC8Dq0Kbz+Mxni8=; b=gr0FKQ3DyCs6RxEU
	YQfBCLKqIkZRp7ceAUtX4hqD7nfSvOB8cgs1LI0wi6LAaheUE9u1SXsHnllG++G+
	bb3+B2lqp1vcjYZ6Bbv1vcbf1hOrIhYg4MBkogty+lzjTKqPfgBAB8c0E4K1RJ1Z
	mZclxaLAbLs+OyOUCj7aPuH9Fd/t8ob87HGhRBddmT22jRvxT0dY0QgNhK7/7dsY
	Gq0dMgeOqkCXlkKZKxOvTwAFQBsYxZCF0CilSEX3aJaInQBdu4IsBIpPPB525E63
	ZIX8NTtIKDjVEf9Pv7f/xpL5vacqH8+Rp3EFHYmX3+c67c7JV7JGbKeYRrWSI/b8
	3i6Pwg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3j6wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 16:02:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb1091fffso13967585a.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820944; x=1792425744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgG1CUCMKjXxg1i7tGQjclcS+aKmUC8Dq0Kbz+Mxni8=;
        b=BUjvswANOpIMSAcQiaaZADshbLdgU6446I5nZGBnS5FibtPQxCTclbXdPm6gtD3ESl
         CyIACOcRUUKhsFIIrfGv4+ccEK8DJLOw/HkQFvqdO1pnCvGCPActTqP9LQat1rKnT4UO
         vMpwgQxKsQyZtuziJ6tXOAGqsP94dxIgUiFky3c/qGgmLuwIv3snuDABQ16hPbWlGb0u
         YIMn+rE0DK4YRw5eI/Og9uItSiK1mchNZxj4ezQxZZVQ4opD6Acez0WU4igzvR0GrygY
         oIevBZH5WZhSZ6K5EVYgkfGcJNSjxigK+OM9NlxJrqTUNziRTO6926HlA7XZdtCLBXHs
         5Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820944; x=1792425744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgG1CUCMKjXxg1i7tGQjclcS+aKmUC8Dq0Kbz+Mxni8=;
        b=NE6HeYeoWvRbKB3gODZ3CIvN6uiti2ZOayj3Ps8QUkly6FAId1RbesJg7GVXHLKAiZ
         LOsJtu9JnMVoJp6nZi6pjdhz5EyqSvLbcqK/L6gm7Gxk3FHwgSmBRK15QvJdug5jkW1e
         L9oNUfPn7UGGPHJALqcyYb8aJwEehiZi7OoisDr/vWBA0Uix5pkmb2Q0ZavztpiyLmZL
         xjUiwbs18LahjBBKrJfPVDJ7msshvZftuflcP/aSyOKWqQGsCdbWA027c9DCQK5CAkFh
         YEkjm9LS/9Ey8MnbWMtzPD4BRH3w/Nxe+xuyNprdaZK16P2WUuRn8aaAg4G67n5aJPGV
         oTKg==
X-Forwarded-Encrypted: i=1; AKwUvBzGMg6TNSX8t6Sc1J5zIgiwzwYNjBWj8TPk+ZnbXQnP6OQQB+JYXVCgg5UOy5N+IGgTe9QWVpTmlSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI8AqT89AiEpwzuBfShcMJBpePP+j6mQpXygsatC0bRKB6UdqC
	xnYaD2qY+prwUTpOPVuT20cTw6phXgmP/GyZzjz66ASc8mrIFYxlUSOhSOGNdriOBs3qQYznHZh
	ECKS3bCfQXgTugf+gM1jK/o+Fz8XQNdCWaDchZM1eIkRztzJ1yMFICmL1hitZ0zk=
X-Gm-Gg: AYBFou286YvrJizLqfVo1HvixIoOly3N/reO1lJY746NgZJFxFdgiBnc7G/DbH08bE1
	rNnDbV4eyRypFceopRZuK6gvUHIGEnP0DvKTGSDg3Y9H/2/C2WrIrw8vzJrNodyfWOHQ2zlubqO
	6wuAHkaZmsGwHJLfb/RWxMq+YjvMHz4rnO7p624ubd+YYx/EFOxnYZ6Ui3LrWKP6u9Pgo+UKYbr
	OmH37BKofou50HKaUlAfU+pjWhCsfCe0y5kvuIl1hKarjxGDe7mGpftkl5RYJ/6jAxcnI8kRYcs
	lqJhW5pIzhxvHpS8LiTZp3f1WTgOkSi91VZYfBUN3wDSN8MgbmCS2iEZv+Bvu5sLSfKhot+9bM0
	eSr1se0cXbkmslpUbbozrbA==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2035467085a.3.1791820943756;
        Mon, 12 Oct 2026 09:02:23 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2035460985a.3.1791820943171;
        Mon, 12 Oct 2026 09:02:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1bbb3fbc6sm1758143a12.29.2026.10.12.09.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:02:21 -0700 (PDT)
Message-ID: <51552a90-60bd-4b87-8bc6-080d49e030d6@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:02:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: define a fixed 25 MHz clock
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        danielt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-4-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012152408.3729237-4-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXy47KEW1AfCzP
 GXtewWtAbliHpLEeTj66idNpoBq+1bNtvx/0FRrM+PiWH6beToQ/M3RoTZ33brOvUwhw+tGPWxH
 sI4LZ+BTahwu24gjd8eJs47UlWvUVmoik0ihO7zIUkzMSr+Jn8apLf4SzRPRRDF6ceD5KUgQQJK
 lr/m5ewq3IvqdS0fnUQe26rV2F7brkejud+sC5eqYHtYNryvBPBGNumK6m7ImsFLF+Elvrhotwa
 f4CiolyAq3LAqnShycRNNe24HEJbfv1JF+VOohRIjPffR2e7bph7s5JJbtG2nPaKyIQ2L3zYVok
 iNmKozi21nm5WmOSHTI6fCq0yLn7y5ooPc4zAoCZW/wyeCOsSO+L8bEd2xEjkuH8NVLNsXOIWeM
 6+VNEjWyplbBIsk+rPHWMT3grrZ22/pjGbYzu2eOi3oFsnu+Zcr8ey3/hqt1+hNGiWVImeoMd+3
 4Z5/xmaF8puzKTkOOqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX24MulurxrjkZ
 9xyI/hVt1yiiI9sr7kttznrLyV8vC4Y5+VXs2IuGnrlhcZ83WqvZ1sGc1ydAMqYbPwHbql7c6/y
 EoiQxIo2dQhkf0IdeKHHzRzZxKRlztM=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acd0490 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ee_2aqc6AAAA:8 a=kRlCQ1XAc8RtWyVnr9gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: OHvGr1XZXKMCdpbvFnsBi60fnVJL0s2g
X-Proofpoint-GUID: OHvGr1XZXKMCdpbvFnsBi60fnVJL0s2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/12/26 5:24 PM, Alex Elder wrote:
> The TC9564 SoC has a single 25 MHz fixed-rate input clock.  Add it
> to the definition associated with the chip.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - New patch in this version of the series
> 
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0e3bbdaf4661f..b8d290eed2f38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -891,6 +891,12 @@ pcie@0,0 {
>  		pinctrl-0 = <&tc9563_resx_n>;
>  		pinctrl-names = "default";
>  
> +		clock-25000000 {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <25000000>;
> +		};

This and patch 4 should be squashed

Konrad
