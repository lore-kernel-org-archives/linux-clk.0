Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792598034;
	b=iVSXYud/qBIu728D2d9AOeUDwLD0kEoul6uBdGjx4FypvG3HW+Ch6kKfAfkLz0lyV01F
	 cjOeyblBmx4bqQ54OX4mcEwLZ0sSCoDuQPhlXw7T7TLbpU3ZFAwpJWhBUy2PfmjqMB1RJ
	 pH7faFHPjOVVZCGGnPlJwAZRS5pAQMH9fLQ56t6kj4FBRjbs0az45xKs5TI9OzJ5L9gU0
	 PmJrxXwfYM4+lzW3LcA/gxmzZpiCEAU8Y1vVQVoHcFvvE3QpnyXUu7z0vjWpdwCD/mQnm
	 Oi3X8jVRzU322qDxz7gdjnJCYJDUP+nZmlKVsnL/JZDbSvgxBX6JldZvwkV/2DVwrIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792598034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
	b=4vi5O3LdK0Jdznm+jx3gXIrudxn5v4ItmWLJ/C3Ah3cmKDSCONx7kx1eC6nBxsghfnXx
	 JOHsdWCsWrlHbYuVegv49VUbUWb+QJbJg/STmn71Sj6H0/iEfrnSbsughcNKTKc30KIBe
	 Wmi+M769/d1mMg8RR0pO07jhH05eNwr4rhl6v7DW/czcxSJl4ondcCPaOs/5rkF6F5gHW
	 vVIsiMW4m4rzVab+2v2mcftsWO7Otn34D8KVmEME503/K9/POXdVV/2rAuUX2U37OFWOz
	 rTCJEc6roCsNMhBgpF3Ls47rhzVVhWg+94he67FUmP2qVTDXTDv3Iyp0yCoSTb+Z8Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMgbQEQ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dCyHkpKr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8211E606A321
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 15:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8211E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cMgbQEQ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dCyHkpKr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFUEBO1482651
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 15:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=; b=cMgbQEQ7VfS06ZuV
	BtEiyMgpVn/N5F8ms7jbbXwaqMgAMC3WP58dKYhowIdj3zPxCgf66HFt0ZE9dZmZ
	MxEQ13a5bmyK7eGoj/nn70Opst95clRXvvI2oUwD5bb9DJiP3MKZlji8MMDYwsLJ
	reApLjQF46W6eHReycSp0Zjq7kUbKP86SPTQZZIhV/iYkX1URRGEj2eBsZ/3oi92
	quwmglX5GoM87OuYqQ7rjVS1y0RAxtc9PuW3WLs2YlTkPywh9x529DXSQ/33w9wn
	irlIFGWzaLByOOZHZFSsiHZmfyqKm878uaaX1sgPwiT+MPnW4jEm2Do4MYWTmS7s
	TgS1Tg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs041cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 15:53:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1013668c88.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792598030; x=1793202830; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
        b=dCyHkpKrzlecjH9q1vhjhUL/j4PoPuvOk6m/EK0otIiAUBpIYTt//wz8ZDstaNWR2A
         tlN6vu+hknNgqkMl/WFl+N/9iNxjIsbXGBfKENlDhpivdT5aVIwoA0IGFJC1vIxYkHVS
         ekcg38qAqbedb42vE5qOuzkJHFlqzaZ0bxGhi2X+T/daWrnRZKbs+2bUbl5+P/aiMD/b
         Y52Vo7wM50HB3nhxlgD3dSngWycP0pHN2cJDIw4HKs4Dz7WzicZMmKqaiOu3t+ReW4MB
         UhA4EP4EhbjZmIaVZHtoeUaBRHorw1uEYJMZFp116elXK81xGCa7H724v0LoQUCGG3wE
         8T+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792598030; x=1793202830;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqL4DzRICL53185SZVEeOxlGViVzUt7GdDfgTKRAxOw=;
        b=P0bh81x/LcMrYIMr3yjHgh71cJEwwsOqa1O0EhMT9xzkrUXB+y+nyJfOQfVC84prjd
         7A2QfOtlB6w5cZADlcMXd2JCdM09s/u0UujiCquXzrTsH9fGljgJNh/AtWiTIhmu8/kL
         +YrWgtswVd/yXUODs0OH03ohMsq83v57FQS34Kp3CBELHuj2GwBk1/tlst/d/pJ45D7b
         wljSSRfKVj53pzpU4pIFSJzObeUTFNM5Gy2MjTvWzhkslX1B7fDevdrfqxSXT9CTUkEo
         krZ8SNps+PocFw9t8sM8ESwF9VMkg/yb8rhfzFgV9+ZmGs2Wk44UjyItzbeWESy5jzEa
         ryhw==
X-Forwarded-Encrypted: i=1; AKwUvByWL9fApvSlzOgX1My0GtjYX5qictklln33um5hMbA5b5kA/1zR9iZCkQ4nVaU6XrHtI1X/vBMBtKY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6zz2IoiJSDSklp96TzxoE4r6RuD+cEuBn0lmf/uF29wwSKyHR
	ll89gnKSbPapcR0j6KlUXa6mFtuApCoBKo1Mz/1+7rmtghd2mvyd1JyhEzfhPiOfdaVnNXKCFBz
	J5+e/r1eJ95go1iZBO/lmRKDbgH5OfBLgbJmSqJkZASmp9it52f7dfhexIHYQSZM=
X-Gm-Gg: AYBFou19TThCCGvcGpkE12kr5vQ/IwhguWx+PaD+tWJ/zkEzPTetSqIrKvDvzVqdnMO
	dENDAaCLrpzB+VB+3NlHDGzDegN+TkPkkEQERiAWC0C533q4EBn9StOUVeVn+YpY0XGRQQRPE8L
	4AtLSVBHi86Yp8Argl03+Dex3j0XslhYNZMmHr6ESPm07H9+/j98jgTpt/+yE5w7nAml1+23vfx
	Brm66tosytn/zKlI6zPkGeTfxJKLX8EhG/AO+Fu5shEfVBbzyQzyfR59mUFKqx6xVSyO3r19RY3
	8mwbJcCAr55csPl2GlpKeT/2cGBH8AN6FRmZyfLXDFYVapAxUP2ooTT9IOmuAiBHwEro74Ota8z
	vs6BLxxoUkYcWOjYQ2KlDY/SaqiP01AhKjJZv7H4gvfW8
X-Received: by 2002:a05:701b:230e:b0:176:a225:e364 with SMTP id a92af1059eb24-190a77580damr2971983c88.35.1792598029944;
        Wed, 21 Oct 2026 08:53:49 -0700 (PDT)
X-Received: by 2002:a05:701b:230e:b0:176:a225:e364 with SMTP id a92af1059eb24-190a77580damr2971949c88.35.1792598029355;
        Wed, 21 Oct 2026 08:53:49 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.81.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm11144550c88.5.2026.10.21.08.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:53:48 -0700 (PDT)
Message-ID: <b9924970-16f9-4c41-9b2a-a5d3b7958c95@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 21:23:41 +0530
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
 <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad8e010 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=rZLzW5DhxuwyX7/NBrPT8g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aSm82yqHt_v6FYJ1XLwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX/uaOjhJJ3pwy
 SHgz6W+wyh4tl4Z7P+veD5/3U6yE5oGm+G1qo5qIhbeh59EHgVs1dX0yOCOC5juVaDGVXks6tsG
 tfVLtEZEihZMeFQhUDdcYCCX3n9gprTBG5XeRCAxoJpAMU+wJN6RB8WOnnAt1cA0ltue8+qh8+M
 mCzWMJ/44vNeRDO8SFSKKB/a0A5z189nBcvcLhp6tq8UXaZNOBT5XrrP4o0p04ToNBubRsl4l90
 cunCVxhpPkie3OPQSI2LtNI1vHcZoNx/rcfqzRHzEveiQW9qixB9V1pazOG9BIJNM2IbtaKLdz6
 I1su/QGG9h6h3EDeFymrbicZ8ilrGM5IbOqv9V+bxstOTEl5s47AcTyu4uY2aFO5neO/jd1ocoM
 Q/OKty9782KWeDAav4oVrRsRSqypOfviXh8uMER5zIU5Rxlz3i3Hg07xxNlP6ZOWx8tPCZKFhK/
 X92tTMzHrkjEXrKiPKQ==
X-Proofpoint-ORIG-GUID: Fir3dqC67p3Z9gZhv_fJcT1ipnPdbxc2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MyBTYWx0ZWRfX9SDRhIOjqwLl
 ojXSyV0xnnd98lg+eHv91mk8lfObjBfzA2UUmrPPdD7jqHUe0CYoUcJ6MQYgmYcMC4MQuDT+Sda
 vKLuABQKGZuTudEH6CMOxOUCBFjtuy8=
X-Proofpoint-GUID: Fir3dqC67p3Z9gZhv_fJcT1ipnPdbxc2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210063


On 10/16/2026 7:20 PM, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
>> On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
>> that provide the clocks for the A55 CPU cores and L3 interconnect. When
>> the APSS clock driver probes, it attempts to reconfigure the already
>> running PLLs. As part of the reconfiguration sequence, the PLL output is
>> disabled and the PLL is placed into standby before being re-enabled.
>> Since the CPUs are actively clocked from these PLLs, removing the clock
>> during this window causes the system to hang.
>>
>> Avoid reconfiguring PLLs that are already enabled and return early,
>> similar to clk_trion_pll_configure().
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 60173b076cc5..3641b2da92cd 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
>>   void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>   			     const struct alpha_pll_config *config)
>>   {
>> +	/* Check if PLL is already enabled */
>> +	if (trion_pll_is_enabled(pll, regmap))
>> +		return;
> Please add a debug print to match the other similar calls

Ack. I see in some places, debug prints are not available. Let me add 
that as a separate patch to make it consistent throughout the driver.

>
> with that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
