Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F785476E6
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987620; cv=none; b=jVyRvc5BBWJ6hBO/IvygH2cd1XF5e/gJS5X5Umk7G5yjP6Qp1rk7EwgEcgIKTobF8F7rluH0y+2vKmPf3ss7H7tJ7IrM+HhkvSgmPuX69oyPTPBHz9jRHfTGj9/6qlXAB+MslvoB6ALniK2Wg3NHIqVJGYA3u9u6WvCTFt4L0wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987620; c=relaxed/simple;
	bh=j80kBhLRbRT7ilx/r64SHGFnzqerZq897S7NQ9XomzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mF4eGKTmN2moMbliS5LPWNlSOa/Npd+Az6rdCswl7Tp+McP31lOgq8uy/vcIP3w8bJLkhmoUfnI1JK/qppOsNZXm7wD794ksDeCuGdkcWjVi9DLnoOKIzY9cMKwNPzAHEE9WjBDe16ItLoBotvn8IsHsGLEMb4eH8I3jZ8aO3fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyXGonpd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsF1upJN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyXGonpd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsF1upJN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBWn512685338
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RH4UQDQQQqR9Z7YiIsMXW6iMHTA6XfoR0NTlbxmgtpU=; b=MyXGonpdVqxct8x2
	fRRYHn5afZ3HJXqg8GSmATfHiv9+UzILA5Tjh9Y5IERP/2KBniqWnkA0rfthwgvb
	3eGqKyZneCD9QqL679OU1ZMvirfsdXXTKMfkesLDAy8pFkvDmIKxi9KOZgETP4Cj
	SL0PB8NoXl2VNfZkmbzM3Px8mROeXfIiVjfCH6hGsUpxV+Dcr9XHECT43rVDLCMH
	pDyF21DrvJKybbdjPTD9ykXm8v0g/xl/OPFsqKopMxFZ13A23gRCDqIOHMzvwYoN
	efZG++hvTjLpBU+AJ22WP5+7HY9t2NBAMO6wYdqa1gX0eEhXBL3d0M/Sqv2oudP8
	VLAbnQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1yrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:20:16 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso143961e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987616; x=1792592416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RH4UQDQQQqR9Z7YiIsMXW6iMHTA6XfoR0NTlbxmgtpU=;
        b=gsF1upJNsoSsl110aJ7pyP3sVyqUZAlhdjT+vgrRCrqaO2n3SgfpufqTZfurHUGooG
         ErdcB0OiJzu+TIGpkVZAjFuRyDETqiayM3RUOG/2kO1LNRoxQGNWnD+e4pOM/jDF3kpt
         bucE3QUrvr2Cx6tTmEFPytw0zZR5vPQlOs0NrZoTsr+R1R5TA5A20tBwVl/P7FkYuRvT
         CvgrNJZ9y4s3ZR9qWXZY2bOdegScegIrfiLJEjEJ84cZZo8GQT8hGhU6D5f+KAHr88K7
         dw2uIT63kcva6Rfs723paT4ULohoaNKpZiolCwVYzO/1KIBpCiZr4LLXYFb9d7igAYx3
         XYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987616; x=1792592416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RH4UQDQQQqR9Z7YiIsMXW6iMHTA6XfoR0NTlbxmgtpU=;
        b=GU6Uaz0tyVFzhMS0TpS+NS6Y+FI1lBajnxPbO0T1hwSEJjIMnauZq5qyGPOaXUOb1e
         BmWqjRKIAvlaD3sMG00Zdf2259YyMZccCZ/ozLwMjamDPqBvuMVCPIRZNZDfLLsaQXmX
         jlKmzmV+Zo79p+30VndzCIogRLAasNUkvj16xYjSX3OTzOxxO23Hm77LOBkXG33iZXAn
         2VB9hucvTEI+1cTlfI6NRvRztj3Oha+YNISPS5BSVTyXhLCvg8OmOnd5tD9tR5eK4r9P
         eBZWjV77rDs3CsPRtsz6KuU3m1QHneiAhGX8xTvU6ifWOMVqnaUksy5McrqNXJEdYN65
         BFDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgEKCFvCxxOWt2NGUnxDh7q6G/ggfN1x7CFzdwVA8aDZ3pAy6uC4loluI/F1gWKshQT5JUzQBf0YA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs/trCuU94pWsvk1SxcblRYEDvaXysUwn7rfsANARdz5znE9LK
	UcKHMHFx4XrnKiovXy6Qgkn+A4pe17SA9Ep4KybML3mvku9vQY1HwEXWMzRHtDIfiijeMUn9Yf/
	gRGuZVg72NR/vFn9uaiy57u5Hkg6VfVEkLBUib5hykCkomtXy4UOcgY7ExtQfqmU=
X-Gm-Gg: AYBFou0EddU8IJ0HladYGCp2kXnXQaVIuQxJkv/xf6yiy3cIQmMEV8RBYwLhVddniM1
	OeLKVmLWEGk7DQh5H6ZE/eRmtuuLMNCATG9XWbxb+chRd2sMSdizgYPBBydjxlFQQi+NzTVTBZL
	JlX0InbTO8ecKmruzmHKnIKfABUrXWkn23+yFuNoGQxHvnIuzgR0VrQHIvDqXxqJgwfnC2WvYeE
	NbT/k9YWTq4k+hMFlKO0aq5CbEmj/ncOyuH9TQu/B2odJQxuP4VAV1UGUWfxoGWkp04CVBqsQwA
	vOBN9Kzz5okUGflpGqshJ939eC+qEFVOQKSn0T87sTQxuEHKEq+MG0jaJGum5nl7xPa5t/T1nzG
	FSn0o1Gj386vbvW08dMJG1A==
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3486339e0c.3.1791987615902;
        Wed, 14 Oct 2026 07:20:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3486296e0c.3.1791987615096;
        Wed, 14 Oct 2026 07:20:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae6csm713353366b.17.2026.10.14.07.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:20:12 -0700 (PDT)
Message-ID: <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:20:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX/eLdew8+D9PJ
 h+volRIDp9TWvQMJEj45KSOppPwpCaRiZZP+j/mW1Iwq7CMATzUHZ1jpdIHeEEQkI7+5Za27ERH
 1y8iR0eO3zmPTDxBHpxdIZbxawyR9DQ=
X-Proofpoint-GUID: PqjbjjfVd94r54nPDqJivLFhQB9YBEAH
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf8fa0 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KR-LitqThD-uOATdN6EA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX9ilQMf2xm6nG
 S5J0c/xm08fpc45PI/Mb4/c+Ygvf0Q0Z6cNCrn2jwoZHzoeLGizS3ow0PS2ThQr4NgI7/j7JoaF
 ja1cmVKh4bdDpUgGttpP1xzvnchqS8cl36ovYfeIW/WH+aAnb4Cq1jETwcnwoQh2JeTTXzecHZA
 OYxh9Je7CilRd7kl+cDUAn2Nb19HptXtnewj0WMLTdIxqG4mnvv7N+/bOqRCJAXGWsc1f/trHie
 INxzHlnifPNzwuFSdlnJDwFOigFuhqthulN3F+FQtH8klpY2u9a1hza6Z7N/TAs0AdTqR7pFHU8
 GJsJaZE1hVkbq6QJQwDdd0+98++AnSqxrFgYRXX1e6iylQJvKWUg3y3TH/WZsU0Rx9EdQw3J0ch
 3mtjcn5nJMGwtI2BccnN2UvXugMEGoS6LibQ5NqR6fveuRl5TuY9uhlrb75g4ymEGH8q1AIXiRK
 ZTjFzg1PtCdFyJ8DuKQ==
X-Proofpoint-ORIG-GUID: PqjbjjfVd94r54nPDqJivLFhQB9YBEAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The SM8650 clock-controller nodes omit rails needed by their clocks and
>> PLLs. Without those connections, the clock-owned DVFS implementation
>> cannot attach its voters to all required domains and controller probe
>> can fail before any clocks are registered.
>>
>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
>>  				 <0>, /* dp3 */
>>  				 <0>;
>>  
>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> -			required-opps = <&rpmhpd_opp_low_svs>;
> 
> I think this is neccessary (at least on some platforms) to keep MMCX out
> of retention. Even if we can drop it here, I don't think we can drop it
> for older platforms.

MMCX exists precisely to let you turn it off, the clock patches
retain a way to keep the clock on during the runtime-resume of
the clock controller driver

Konrad
