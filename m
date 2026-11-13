Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541398;
	b=uZMeQPNMKSlMRX/61Q+k/b9dJHQ3aJX4boFwcFp+GApxJO9GQrE+GMMW83E+nTGEZh8Z
	 gYsmWqWEe8oOF/Fvtlr1TEiJnhpwLDBCw4igQZgAB6U26ackxTmqBnEIa/0kZQLpL2yiK
	 OCE7EJbMprupyywRoA2Hx12NsIaH9yqxouy8GuyyI0ghMOTh6vQAyfiLqTTq3Xj0bTgZX
	 Yjkwb93hK4oAUPu3S+9jF21byFlv4mubQo9IhAgwn/WKbxopdgCFjZUugNPxeyFudgZO9
	 xHLypZalMg+XtekQW+f2MdXiNk6kYN9TFWklVSovFiiyYjxNq2mjPKj+NSxsHXIlWsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=;
	b=D/X1ISRfFO7n2+C5r58zVg6T5fuJ3juC93+UchuIBxNiXFPUzLpum5+4zliTVno5xXHk
	 rXuRLVa6t3yCc+hFA68M3sJCCXKuTcH9vmAsPzFu+3OQ5RO1w9IYHUlN2qgpiDP0oVKIE
	 Cql3oZBbyYZ7OoJztCrM6VwEXirxOYK9oCRQYDSQLZ85eZfawre++hQsYucdmanjPstzT
	 S9uiUqRYUXkKR0VOdUP3iL5dX0hF/R3KvWooyYOWyNiIRM3TFmEG/rEBHZsc4N6moDS38
	 7oG36ELmW3Y2d23SjRMQOquOqIoslD7PBVBZcKEXxEkfErss9YbyWvod3xhHPTRhAew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWZqkKJ3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Drhx4NFq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECAD606A31C
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 03:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ECAD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nWZqkKJ3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Drhx4NFq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K7Q62179745
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 03:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=; b=nWZqkKJ3CLkwxq5U
	8pRfvFrg5fA2zwANer2P5rrsm3l06Y3TxxWLYN1Mb4uRUq1MiOzWMo69f22sdn46
	jSWX59YUz8lkpEIevAXUe4jDEbILWsXbyobh+WoQDoJle52wJnU3W4b661hZKf13
	Ndrcl/gqiPOKTITBQC0I6G59c/NSGM94yquZRBVfpGetA+y9enkHtCmbnLlWDplu
	lXDT1ua5azMvNW3e0/FuxfUWzD3k/UhWRyZw7rPYQ+WZSXDFLcV6MJ/o3c8lbb96
	sALT6+FXMS/SRffsSWB87UZ85UemyWUoBzjlbRXgxg5OoGY1T5gcoC3jLoATTvnA
	7alIEA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yumed6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 03:43:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so494548a91.0
        for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 19:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794541397; x=1795146197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=;
        b=Drhx4NFqIehATIow3r+WVNkcgWdgaTjh4ghyCUHiBXMNMdnZ5Zaku7KS1bbCYnS7DD
         XqEX2InMCm2CyhoQFOUf1I18MAl4LalCX+ylilFAnVZQQcM+llLBZq7rUNwPrr3B2I55
         KzoJNPjvYtxGbp3xidRuwnzZZqS8/IykB6L63RjcPKoXURLuocrtVh2xDOTK0GsCm+xh
         ItmqdgoZkfbJ+e7C/EnrS28BVPLJiDUx+HjUiF5kD+SdUMa95FcK3PBqjThmsCvkUNyO
         HcWe0pisoAAxeDQ4CDmGOvvkNd/WReuH0ic1HQKkstNMrCiDySHwVvvq2EH2gd9UtN1T
         OE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541397; x=1795146197;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TpCoXmViLUTdUBDjV1/9xKc96GGjy//lN+e1tkoCFfQ=;
        b=IMNplRQg2ssxBJ/NxUWOER0VVG/qQ00l5pXcBucDFTgEhb4UZ9z+oJ9b0VKG61GFlT
         KxferHlVeiXyZFD7Tp2g/tLp811DD6bvVb1Lblod/x5jZmq9IuvoMe9sqkjhBTJ2dNVb
         nOGJeGaoFNIEYINl+0H8B8AUb73dYNTEH9cpthEh2xacnNbdTMTTic5sjxXsXiq2dVIP
         plKM9sFjN+VlR4s9eR/ZyN4N/6CsSfOHg/1XuJrysdXW9GVKJaaA6lvp/98btlGdsbH3
         kZmK4d39RhCFyQgPURtP3k1yL3syH852knKLINn4qKmBcsKzz22+O7TbO/o1wiL8dKHj
         2HDw==
X-Gm-Message-State: APuU4Z/xB+qsIGa5Wtk39f2V2WUPcKMGL1IM5Hdqj5aBlTS0hRb3FS//
	16rK89Fhimpe1K2tN/iQzR6y50FS9l7yitIQu5GB5GMm9cvDLyeaOoAJcWyS0aUtROUx87k/EX6
	yVPXbE+orVr9Nc8HrRLPq8QFdyO9t8Bla97zPQKi6xCMhR022AvVPZzJpaiI208Q=
X-Gm-Gg: AYBFou0hre+U76cPcXXgIuAGXtB3BvEqB5rRHoOXMIB3okdn2ujHwTGC1fHmsNzKN5b
	4dEWELcKfA25C5fyegB+bdfoEL61evPLtJzPrB1qa8uJtHaxvIVxDSMGxCxmhOytGTCDVgJ3UHE
	WV7/4neJaOZ4mtd11Fm5Vd6ExyMQuT33ByQZYIAjPSy2ebBHt75Tv0On+qTaWbrubB+AOHZ3wWI
	HwJYyU9w+PkvanvVHpBWmCM0ProfY9GJkxRQCXHNWEEWPeSNURKwmFvig5JNlvi3mtQPYaY1Zua
	womYVpSLHbXl5Mdw0wweh9zOW+iKWzi/Cs2Ttfu9fdBQ+oSiqohXRY8nipqJkB+KAFCZ1Lz1h6c
	zkbRViaiGs3RVDpvpHGo4+AyYsoTdVfPBI541ILBHDDMB6+ltnKpUW0ewHPYFPAO/Q9ugzA==
X-Received: by 2002:a17:90b:394d:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b1b0b9213emr653709a91.17.1794541396659;
        Thu, 12 Nov 2026 19:43:16 -0800 (PST)
X-Received: by 2002:a17:90b:394d:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b1b0b9213emr653696a91.17.1794541396142;
        Thu, 12 Nov 2026 19:43:16 -0800 (PST)
Received: from [10.235.8.108] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm2309528a91.11.2026.11.12.19.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 19:43:15 -0800 (PST)
Message-ID: <ec0a8428-b7a9-4b7b-ba0b-bd4a8737153b@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:43:11 +0800
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
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: ipq5210: Add NSS clock
 controller node
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
        conor+dt@kernel.org
References: <20261111-qcom_ipq5210_nsscc-v2-0-7e2c1dda3ed2@oss.qualcomm.com>
 <20261111-qcom_ipq5210_nsscc-v2-3-7e2c1dda3ed2@oss.qualcomm.com>
 <sashiko-outbox-210918@kernel.org>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-210918@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ps8Ss9NaWmvNKJitU3-rjsvvqvF1wdwq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxNCBTYWx0ZWRfX+7rXSj2ucN2G
 lato9sC3u0VmlPLbcT7PaDLupT8siHq+KZ5AXYFPyjNH2X6spixHXCqmrmiulpFMAFOZyKC70pT
 n6oLBb9Cs4XwIRHZX/ZYIYrp9hSrKJM=
X-Proofpoint-ORIG-GUID: ps8Ss9NaWmvNKJitU3-rjsvvqvF1wdwq
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af68755 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f0regg0dAIW5IDvKWx8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxNCBTYWx0ZWRfX5uSP733m0hYN
 BrdJXMXTu3JoE+vf1hNsgJyjqlvm1Q4M0tTOUrtkd7jVs9OhIAQ/GHjuxT8wadvhr4MZ6R8xZda
 /HSDnafl5zabrbEhAmIEq6C+Uoax6eJv4L3AqouPFWhgYWOmCSZMAB2AVrcM5mLjbDuJXuUgnSM
 x5xZhtZzS6zZlk7STmFUkrJVhlyDN4q9MkwnY/NU6/ayLEHzRFROKM1VJ2OAIzKdUNYUxkNRppJ
 vEbrnlY+rMulYFihoAW5xyfApGezLAweOU7mi01SsF6cdxbsTyQ1RY+LxcAqCik2TypKd71E3IU
 azP+FD4tOnXTuS2PcKXR2ygk8kub9elfYaA+wD5Mq6UnPvV7riu+E0VTz2qfyVmiXWiP9n30R+R
 iOOgFr/Ywk57zPNgHPXXqsm/x3h4acea4uK/ZZmPwEzuteByvjKWL4Vti2YVpWRMDtmBX4dU9xO
 tffPHu+OSQ5sjEa21gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130014



On 11/12/2026 6:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: qcom: ipq5210: xo_board uses xo_clk instead of
>   ref_48mhz_clk
> --
> 
> commit f6342940567706c16d7408b991562c108f13f6b3
> Author: Luo Jie <jie.luo@oss.qualcomm.com>
> 
> arm64: dts: qcom: ipq5210: Add NSS clock controller node
> 
> This commit adds the NSS clock controller (nsscc) device tree node to
> ipq5210.dtsi to provide clocks and resets for the networking blocks.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> index 0c1ede0f73b21..11915f8eb1567 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
>> @@ -331,6 +331,46 @@ frame@b128000 {
>>  				status = "disabled";
>>  			};
>>  		};
>> +
>> +		nsscc: clock-controller@39b00000 {
>> +			compatible = "qcom,ipq5210-nsscc";
>> +			reg = <0x0 0x39b00000 0x0 0x100000>;
>> +			/*
>> +			 * Note: CMN PLL output clock names below are reversed relative
>> +			 * to the hardware block they feed - IPQ5210_PPE_CLK is wired to
>> +			 * the NSS hardware block ("nss") and IPQ5210_NSS_CLK is wired
>> +			 * to the PPE hardware block ("ppe").
>> +			 */
>> +			clocks = <&xo_board>,
>> +				 <&cmn_pll IPQ5210_PPE_CLK>,
> 
> [Severity: Medium]
> Should xo_board be parented to <&ref_48mhz_clk> instead of <&xo_clk>?
> 
> arch/arm64/boot/dts/qcom/ipq5210.dtsi:
> 		ref_48mhz_clk: ref-48mhz-clk {
> 			compatible = "fixed-factor-clock";
> 			clocks = <&xo_clk>;
> 			#clock-cells = <0>;
> 		};
>     ...
> 		xo_board: xo-board-clk {
> 			compatible = "fixed-factor-clock";
> 			clocks = <&xo_clk>;
> 			#clock-cells = <0>;
> 		};
> 
> arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts notes that xo_clk can be
> 48 MHz, 96 MHz, or 192 MHz, which the WiFi block divides down to the
> 48 MHz ref_48mhz_clk, and that xo_board is a fixed 24 MHz clock routed
> from that 48 MHz WiFi output clock divided by 2.  Because xo_board uses
> <&xo_clk> as its parent instead of <&ref_48mhz_clk> (unlike
> ipq5424.dtsi, ipq5332.dtsi, and ipq9574.dtsi), on boards with a 96 MHz
> or 192 MHz xo_clk, xo_board will resolve to 48 MHz or 96 MHz instead of
> 24 MHz, supplying the wrong XO reference rate to nsscc, gcc, and sdhc.
> 

In hardware, xo_board is the 48 MHz WiFi output clock (ref_48mhz_clk)
divided by 2, not the XO clock directly.

I will add a fix as the first patch of the series. It changes the
xo_board parent to <&ref_48mhz_clk> to match the hardware clock
routing.
