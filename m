Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4583AFD10
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782133428; cv=none; b=mbc92HbBz6FhOgKOWIITklku4cRAT2myzOytFKUnl+c3sAc7hO6VhX/Zp38UyDW66qzB8izckVhcFn9E29fsaJyc+eXzekHX9x/YwF9IrBOAef6FOZLbIY+WB2rvQbMVsA2MMNvJ8cSUmBP61PcWcQ3vl5keaCEIbjtbFHYywCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782133428; c=relaxed/simple;
	bh=LfAbiZfa6DruHOchJf2O4gSn9hmUf0OdHh+EKVCKKXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=if+Z4hLhNWSnEt9d7kLaB+HxZPv9q5u5M+XLl1Y8/NqgN51tyxa9ZYU/4KSbedOBQCUwI2Nwzf5Rg5TJL19H8KAD+F+RyVjQoUjoYxZgKn2htGs0fcHPnIAfX9Ovzur0WgKr2zhTzVqyYlGDN47kZ7s8hksfx5bQni23f5vYLh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyJuQkgb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnehh1oS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PyJuQkgb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnehh1oS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAn5rR472531
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+/LkGW4Qe6UVR0xMsntXktSlgIAIOfnsCAKWcIu3AE=; b=PyJuQkgbpZxw0ED3
	n9c8oId4IxnAv67n5SzKZ5wC+rDiXkvbqjIWuBPW2NWS1rx47/jQeMJApXWHip2o
	zf4PERzFf6QneBe2Tnc2pAep9kFt2IeVfpcqWnI6ClBpmnZtAYpZ4OxTckdtFbUd
	USm9qfwcvnvoA4Mr90evhQSdMrrMoOW2MnQ6BA2vQa9q1YgZmdLuq2DbX5feEzbM
	ZNeFJ/I43buR8bB1AHrJUqmaLamM9ixjxT207VM0PjEW7BmUynkg4cjqqFuSpBLu
	X7JwQgqZhCuwPcQpRIFs+z4557OtKDtInqpJablp1X/TbptZBlIMwRm/nNhqE+rj
	CXZF6A==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3cq0ft2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 13:03:44 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e7062a8951so1440924a34.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782133423; x=1782738223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S+/LkGW4Qe6UVR0xMsntXktSlgIAIOfnsCAKWcIu3AE=;
        b=Xnehh1oSMHPDZjQFftALuI04UPjI4hTyoaBBwDroC/HReK1LQizYg1+br2QwP4Ui3L
         digdEzxbba9oaPyubK85pdTMbKqSMXuiAH5sXsjJf2mpMHAopqqquKezIql7im9ZHHGH
         XBmjZBA8JyGJClpw08mM1ihU7xPQQPN+PAR1u1ArQvt3ArrTjJjgOXS8g+F0zs8EAt3Z
         vbzhspPON68SmPB4JfBeW9BagYfRZ12e9I7sW2dBXN1kaoXp6K9e/MdK1Fwrw7ksqvKv
         yZ5UvN0BfQrB4DbsXbwrROUa3VtRVIRtns+bTRK2hpqlFT/F18UPr573FGwbz3wZxA1p
         TCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782133423; x=1782738223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+/LkGW4Qe6UVR0xMsntXktSlgIAIOfnsCAKWcIu3AE=;
        b=joje7BuDM/c/Kler1GpIA/rBEJ4nOpOeNLSYkKOV1mt/fHNmW809pV2jDOkybhxazS
         cSZwRwEvNhjiZzxbCPsjNtporOavUug5QJeySWwjngHoLa8XC1gw5AG4OgOHovAHdHVg
         P4tMDOSxaOhyCrC3EW8RPo73AOnoCduDSWQ0SeHUizpWHNKbD0PdY9fBY+fFcAeE65kz
         PG//k8jum5dKwFGUmwHtXNiOdNhfWQVxEGhQ/K/LY4/1PVIvA+AEM5dPjTzaacf17SpB
         OEtykLZs9mBUqtaKsTEVdTYrkOHcrkANEPU4HFr5D0Gk0QCLWXeTpi5u7KEa0/tBAtyE
         vj/A==
X-Forwarded-Encrypted: i=1; AFNElJ9Y8grrISb7AkHo3KtIY6w3NyT+2T6mjj+z4uZTkWcQvq3P58MWqojrZACP4qXr9ru3zwOU6YK9xOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeIA5K98ssDn+G9u1rvvzFSecZkVGy0gl6KBQ37tw/oHzQM3Ax
	glQOwLhTt3FFN8E43GYH5Gru+GDUfg8kay6eB/QqnTCCXkQbfCSKyYTqKle19rm/zErhNgAa2FR
	ObEmYAZo/hh4df292vm22owzDOyhyc6P6SD+qHriU50G7lAuWYSTn9nJDYbZGQf4=
X-Gm-Gg: AfdE7cmbvGf2ZI8U5ccPogFEGSIvuWt2r1O4zNe42Q9VPKNMAY6kB3GSSXLOfaDtaOf
	IXyvyOm3dGabOpTEX9uD4WKYSG4yM5w3bqBToM8ChIBbf17ZXK9lUrYsL3Om2gmGfV7mh+uGwo5
	s5CYw2u7EKPwNG17yjYVVj4brPj3Rp7KN2x341ME9CZNpR9bQhT+VIVLHW8cFlizbuVHjU6FgR2
	ZJgaC7wtccgkKTuEhtMB6dIkoSFAEkwAxXGSefHHc61oek5y3fJorlpMG9SwgTOXqQ/vsigw5U4
	1ZftIS5ftuGq1IsI98hQ+3XAQOKOhLp7FnwxRnrrwz1YbI0b86TRrZTMGABj78Tmer8wggm4oju
	UgOsjJKMOAjimwbhFImoEtJ0TrDmKSzT9KaQ=
X-Received: by 2002:a05:6830:2585:b0:7e6:da95:a7b4 with SMTP id 46e09a7af769-7e970b12dbcmr130898a34.4.1782133423598;
        Mon, 22 Jun 2026 06:03:43 -0700 (PDT)
X-Received: by 2002:a05:6830:2585:b0:7e6:da95:a7b4 with SMTP id 46e09a7af769-7e970b12dbcmr130872a34.4.1782133423141;
        Mon, 22 Jun 2026 06:03:43 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49b77bsm356454866b.2.2026.06.22.06.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:03:42 -0700 (PDT)
Message-ID: <cd7619b6-a428-4ad3-9926-52b846953634@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:03:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/8] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-5-c939c22ded0c@oss.qualcomm.com>
 <5f32d4c2-f90d-4f66-96b1-c9c7987ac18e@oss.qualcomm.com>
 <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajkvV28hEWFfnwa6@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9doS18NDD6WASFtcwCPt-E45M7SjJM_j
X-Authority-Analysis: v=2.4 cv=VKXtWdPX c=1 sm=1 tr=0 ts=6a3932b0 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pFwZyuztDp_4AeEFtcYA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: 9doS18NDD6WASFtcwCPt-E45M7SjJM_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEyOSBTYWx0ZWRfX46gU18Aq19xU
 DRhtLjxye1Ns0/mZILopiy9wdvyQoOQ7lEqx6IrolATkT/k2TDc34Ao9nQjPT1kN2wmgHEHyYxO
 D663/lVDNrh0uN4rOHkmAbZ3RQeeQgOPbuL1oX/xws1o+4ZNE4rrnFRFrB2lnQQT5/R8/vWPhfl
 svtAfrTvqXzAlPA6ouQBvKYSNWqlvZ61MT/quduyV+BQehHJHCYre0TB+kjmahNe82rdG0rd9tG
 3nu9V4WXUXVPHMyS8OTU5hT8LonJeWBMvrXJamFMKdfyz1rLewFA66HuOY0rjfIcV7d68dZlMbV
 WTfD/+ZJoKdmvzS9VpFDscBahf8lvJ2gXbevSZGnOPFZkS5WVwL00HrrwCxtBuh84VwpBCuFXQE
 EbhTAnh4A6OOOlEyqdTP4Uui7aUwNKTQnUES+3pD58eCiUQptXBsneurqIBuoLF2muNhxbUG3HT
 KmrzXHnzLNLWzqrcjtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEyOSBTYWx0ZWRfX36m9CL974sW1
 cQU/RtlLzwt54l0pA5nWoOlBB7O3Dp6UG9Gx2MpjyO03/AaZnY6DhsMiCeWFFmH3cvZll41/VIi
 gkbeSoG+sw9K/TMkT/i+N4XRrthBGoo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220129

On 6/22/26 2:49 PM, Qiang Yu wrote:
> On Mon, Jun 22, 2026 at 01:35:45PM +0200, Konrad Dybcio wrote:
>> On 6/22/26 7:11 AM, Qiang Yu wrote:
>>> Mahua is based on Glymur but uses a different QREF topology, requiring
>>> distinct regulator lists and clock descriptors for its PCIe clock
>>> references.
>>>
>>> Add mahua-specific regulator arrays and clk descriptor table, and use
>>> match_data to select the correct descriptor table per compatible string at
>>> probe time.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---

[...]

>> You're also missing PCIe_1_CLKREF_EN (+0x48) (for PCIe5)
>> which goes through CXO1_>TX->RPT0->RPT1->RPT2->RX2
> 
> I have removed PCIe_1_CLKREF_EN in dts node because PCIe5 PHY doesn't
> require QREF. So I didn't provide its structure here.

I don't quite get what you mean. I see that it is there in the graph

Konrad

