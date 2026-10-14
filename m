Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA45448AA
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988580; cv=none; b=GILswQq0GqP/ME/l7/DeupUH4dlwfOwzjIm02w5oYiau4jcqn3f2ZpWu6Pn5+ol0ym9t2foiWwZlK7afAwyEtR0lEGfq+DGOZtz0sJ2+Up8gkU3eb9+Bx7clvRmw0A/C2cu6bHTxI0OtrNPY1zmzgyBUe4+RAGZ3o48t3bseE94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988580; c=relaxed/simple;
	bh=mzjBXcJwvR3mP2wpzKXtsjTiclq7JD/M2/04w4VLf5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P91qgorxPu/62yEBNC5BAC2NdZftRtQeNdGcdACbC7Nb3vG6HLWRFAA72ST55uNTiXRLIUO5RFzbOzZ833iHvw3OMg8upm9443ImoysJNwlCb5fZdZw/njJ4CXB6AMS9PSTHkuiXzEa9AVmhqMqEvYKxVEmaeGiu0LPcu2ti9uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJhECvj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dD6nRqKr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJhECvj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dD6nRqKr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBP9mm2685307
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:36:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wgur4uSx3uLBl1Y0UpHJoHojhBmbV96MGZDODwsBCDA=; b=VJhECvj+L28mtg+k
	MmSqpEXHqDbPRKqYUSNS5w9vXh3JGbNqggR0zZSGcn9cuYnsc7D+HwaeS6pGNTx7
	gP0GO8NHzYpu4aSvB9qsTAXwjJN5ZFS/UN1OEilxzMhBjRLrQVyn2oDDRwzECQlh
	sXLmb+tqFI0SezlBoSuH6bpPiaotaY0Nn0Cz/sH8IyvsrwAAfWpoVxRdcCj8DSmd
	RaUrOT2UPnYVWRBVEJ7KEvJytkq7TWM2mWg7JwxcoMnNKed8KHutCld3tkFd6k+r
	bxNM5/Xl8MydXr5PIMULFe/3dXQEzxE25yGqzPvuK3H2nWRXlZ8u1AS3uo0qw/UZ
	X0LQXA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u2224-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:36:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso147371e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988576; x=1792593376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wgur4uSx3uLBl1Y0UpHJoHojhBmbV96MGZDODwsBCDA=;
        b=dD6nRqKrhQmMgijrvcFREBfdFN2YEfE682HKNuNHpESciCAEvStKBt4tfDBOrPtI/A
         WeHpImBVlS1BdYwDtgmzIVMmDgdG9E6LM8aXHJISQyimdIXClSYK2ydg9WYjgKFKdw+Y
         TjHRFIOrAgGMKscIRjIrJu2BBCOk/LcHRM1/JEuWpOTU/WKUwWApWVGFtFZHWZ607zB2
         CwXbluP0/wBJsPxAf7ALIs/Wig8HfZecSnAG7KhdNL0Rd2AhI4P9lSP5w9wTkNJUaIvu
         XYC30vikwmPz3NIY+Ou5xzifw9MFSbeDxT/RZkkWk34bTAwWZz7jIvw/0lDSMqnD4GcY
         tIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988576; x=1792593376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wgur4uSx3uLBl1Y0UpHJoHojhBmbV96MGZDODwsBCDA=;
        b=BWMZ9TWrTA3nraAp1DxMgH+Ql9TgwngBHgEp8aB681xwZZ6opYkS4m6CH1F1TH0Lff
         Dt/BuqVZu4wTe757CR0RWuWPsKkyTMp4Mk9J8XeIRqFk1f3FNDPftrcYV9oCAA7r0Mly
         cfc2/ILsedu7k4zHKi6OZ4T/rSsCojXBUQll9NJ35BPhEsGVCbZZITbRLlDhYK+YF7/0
         aXFc+NXunJDtI+6sYabRDoJfkXzky4DiOmvfrTljPfrSxe9SweU8D6SqmcR+FO/DlfCK
         lWW52ya8aTCP6vu98uBkDvDTTPxeF2ciwCjr5CCDsoCSW07U/RoOBskQh8fRr4Hgj9s6
         0QTg==
X-Forwarded-Encrypted: i=1; AKwUvBw7/HDTpjSYRTjeWzks7NaS8tFu3wXpLhQJ2QCTSZPkPdHBW/QHoWNw/0xvYDGWpRHS3ibA1k+go1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKj8j1BZrfJsbYuJi52u2lQLNnQ1y8yPwfh337FaNnDmNuE5vEh
	17HPyvM0TgrVf9EMlTHDfl6KaBNrZcOw955dro7mVL8BaYOkGgC8IMmzzh/tndhzrURvkHOJSyP
	q7JYxEZOqseoWKpbq+4B+Bf1quxAByZg3udckKxM3q91F76MSoTI8XrfJcSKpB8w=
X-Gm-Gg: AYBFou2Mck7Z5eenmJnU+qX1sCNpf7TojTKvCuHwwnaJBFSfNFY7DJqEzsJ8eaBsWqu
	Lx5kWphnjtTHMMsP9XtqqiS5FYLFhE7ERnEWP0bY1/hLpHMz5AfLY3+EjeQ/s5oLYJS5o0p0lL+
	DY0VXcC+xS4x7c87xCqxZqk+7ETGVN6qFhcmqFB5QmgqOIJOzpfI0mZW3u3r89wKoSkkFdlfYBE
	uwe9EKxv+rd2tEVr9QkOlIngEKXtheCXmVeO7ysErKkAoy8iDM5KORSkbOUpI4wX0dg5rX9loD5
	4zuwNzDkUrskaUKB3srqs15YGKBTyDGjTfd2xaXm1LwZOpkynUD2HNMQjgAhITVS9qlNksgZ8zb
	Qni3Yl2RXxCUaH5F8yl3qzg==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1774559e0c.4.1791988576406;
        Wed, 14 Oct 2026 07:36:16 -0700 (PDT)
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr1774536e0c.4.1791988575925;
        Wed, 14 Oct 2026 07:36:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203839ca1sm1288926a12.11.2026.10.14.07.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:36:14 -0700 (PDT)
Message-ID: <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:36:11 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
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
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
 <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX7kE0QwSy1EpE
 17ASYkiTU96Q67kFLixUt5dJhXiCR1yY/kMk3BWLdcRmCINufpCDKzNrA7NC2Tu+p81vllfo2wG
 460+0T+YN/Ev4iB6ZSUmk8kTVYr5qjA=
X-Proofpoint-GUID: krkBR4mopCBkCGv7lqSRvnh6OiN1A03-
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf9361 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=7Nn-sgJJM4qzZjt7KU4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX6qowatoodgW4
 lwsjkYIE2L/yJGUvfjgWBQy0bxVsxAccfEWxnGp7AiC5bBDBbdQ/1h7sV11fRVF/mNGXCJGwrks
 V0UFlxc4gky08S4dmNBdIpWIXpAXZ51y+X6conB6zPljp8cjnXFML3hXKoDWeazS0xgy/eDHxGn
 t7I4lhQlSpB/ydyEaosCQxFbicM+KGPtBJ03QuKP1pEAOZameCEGPiZEn0yegDGaQpomVibctgZ
 xyilLqwk86BDhHHc93lXJFMUvOG2azCs+L2r7chG05zUs5skdEVtmYg0AuBmar2b6Oe0zBHFeKG
 9ypvmN9dN+iP3EeW0/QR8e1SncjWI9MkT26tYoLZLG9XD1CRPNYE82iX6XtAlGfZwRgirR/IywE
 Cv0/oybzIHAdmavBXPenu64nyC16sNCR168pXEDZ5Ggn7uxRBEhMwruWy4R9pGbupYfYEEf90TK
 CEGg9wesLHFcklgxOkA==
X-Proofpoint-ORIG-GUID: krkBR4mopCBkCGv7lqSRvnh6OiN1A03-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The SM8650 clock-controller nodes omit rails needed by their clocks and
>>>> PLLs. Without those connections, the clock-owned DVFS implementation
>>>> cannot attach its voters to all required domains and controller probe
>>>> can fail before any clocks are registered.
>>>>
>>>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
>>>> Assisted-by: LLM
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
>>>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>>>
>>>> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
>>>>  				 <0>, /* dp3 */
>>>>  				 <0>;
>>>>  
>>>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>>> -			required-opps = <&rpmhpd_opp_low_svs>;
>>>
>>> I think this is neccessary (at least on some platforms) to keep MMCX out
>>> of retention. Even if we can drop it here, I don't think we can drop it
>>> for older platforms.
>>
>> MMCX exists precisely to let you turn it off, the clock patches
>> retain a way to keep the clock on during the runtime-resume of
>> the clock controller driver
> 
> Turning off MMCX is possible together with suspending the dispcc. If
> dispcc is resumed, MMCX should be at least low_svs. On some platforms
> it's handled by the cmd-db, where MMCX has a minimal value of low_svs.
> On other platforms MMCX lists 'RET' as a possible value, however it's
> not enough for dispcc (or other CCs) to work. In theory, *I think*, it's
> exactly what 'GCC_DISP_AHB_CLK' might need to vote, but we don't
> represent it.

Retention isn't a ""real"" state the OS should vote for, as the HW
downstream of the rails generally needs some flavor of LOW_SVS to
function, or at least I don't know of any such cases.

See also

7178817f1904 ("pmdomain: qcom: rpmhpd: Skip retention by default")

Konrad
