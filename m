Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020737;
	b=k1wNqwaSQIwSO7ALu9xs7ehLwVWJQndhbutEE/QIADoAEigcWe/NL7aHB+jgLnjKEyPv
	 fMseRwrTPeUqruMBHKlQahXU1DqvMFl3qe21qn9MmQIO8g1xdSHrTUJdlUTnQ85VDiXbs
	 yiyReHIu9yYc5IajIbZKPITndqlyq0kWBkC3hrhm4SSkHdv+IY43vuR3VPhvGcD97NK9H
	 pb2AZ0NFw8DlnHyzQfMnPv8Fj/HeM2RvCqKIdlvCmIRFL3bwXZuyiNV3UY0cTBGdNXH8/
	 D6au4XztLsrdFCEjdizEHB4oU5oFHDcXRSdfv4ADeZ5uHfebBwrOp4B4PMR4vUmDQAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
	b=E57ePa12zFNzG7GQHfSKQR5WeZ7Se6jb3MPoH8dcOWoaRDKv7UP7UrLi9E+jCHFZ07gJ
	 wZ3ubMoc731vUldfnkdzk5XLrA6PbsvTOLWUrwcK6CKKdufvkpE7+nZQzp0l5XaipZog3
	 H9qxrx03YpiMChppF2L+Fi2PZdmlotTe5Pz++Qm0FWhURsmd+/SyZAKoQiZ3qTQJ27Gwr
	 Zgl/EN+ZbQ08K5+LSNYqtKgiA/EX4BIDvoKtzzod0Vf6BWgJc888F1A5kUB6u8a+A9W1+
	 nKwTu1t70Dw77pUYEXmYgx2gGjEDpxnx7rOqkFaKrGszR5i/tMg7iDxUG7wzm+EwMsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NGFEk8AC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ajt8vyrW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ADA606A321
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 13:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99ADA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NGFEk8AC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ajt8vyrW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAta4O1548003
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 13:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=; b=NGFEk8ACpJBSGqlN
	l6Rk7apbp/vgUNssfJ0pPDQN1vPFwmiO+HNLvgIbC4ymQrEnhQLmHGTc8fh/lLZK
	J4QgEVzB1cSkR1kPep3qiBeHAhx0Nc0SJJ99GDynyEl9JCJ1cEwHSrLh4g6MaE1X
	9KMCRLDACZBmK4GVohrpX0Ud3OFIQzV8/2vEwstZ7qinPZ3WzSk4GEN2xbEXB/xs
	Qi16szDSyqB3V6rKPiFt7GWbcHGt7MJ3blA7OwQ8zm+PsKYS/wa9q02Wt2aT0V+6
	q6ukTSUQy73h8BIEuk964CYqjJe11YcEYBI4FKF36PmfcnSC3nMjr2MUwQ/q0Vv1
	HN6G7A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgstkew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 13:18:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988b7a28291so46428241.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020735; x=1793625535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
        b=Ajt8vyrWCeNj/FHHFBZJ+bOvhLy0eg7Fa3Uy3Lb5bntMSIDcLjzGiJE1JcpJzejkat
         4qJfEmy4KCK/dC0kZG8zEdORzC+wzTNWKVNAsbeT/kNr2xuOEKaNjRYECtR5MwdzMq/P
         /e+p8+P6yGODPFdwVm6N/NSgv7egb7e9aWtql69th+G47Bc8DBkqEXQqozytAQDXA4ir
         G6Oh6CeBkw4RDtJmK1SB6JV7HO74P+VhB5PrucHvvMVD5CoW86Ru+NSgQiW7gZPLpfin
         cu56JO37EgaOSle+DRywBgnXE5wdw2H0IID4suu9NjLBS2Qcb+J6qm3O1hKp5LC35hC9
         JEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020735; x=1793625535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
        b=fH9hnHxNnOGtmfyIkvzeNEAO5F/S3IpBcmjq/S4nCJ2toWU9KkyIOdTJJw4bWddZLk
         1wPgGbJdK6gD0bcST9X3B1oN70QPbZVfcn1hTjAtsZrSAQnsNZ/eK7lni4WmU9SXyNyf
         GDntkZABxS4kGE6F0vaUsyXNRXPKMWbzEbb6DJ5IivblXolRzy9hZ7FSFS5hPxShV9Vs
         ht+0/1khSZK/nisG+2McM4uIM9LxOr2RAfwiZU4AObfm02h44EWdgqcOsNPTce1SewMd
         odfGl61Iszie2j3SqfNO+uT/R4g55g3gyStbbzwKQoB0SxXP2kWcxGgJv2TNG1JC6eKL
         9J4A==
X-Forwarded-Encrypted: i=1; AKwUvBwMoryB3NY2jX/03i+UsiXdrCQx6IGxP4UdBftdgqwCrZlqyNXcnMXeV0F2W7/rFOtcJdxkAOdM044=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/iXOvxs2zOzy1v0xNBGuVa7JXZjqSLsZtnqSjCX2ai/O6BqJe
	3ArRYMRP3tgi9IQrqFleWSOBFPpAKbyDPeVA9tiCM/B5t4+RPfYZ8zoSRj/vAllx1OjAV/6RtNO
	cw5zfgjCdheC4p3yluTOeYFLBf2aG9KdxL6RNFtk59cT9EGR/bXPp0nR8TSAB25M=
X-Gm-Gg: AYBFou1MHLL3DPGrJwU1YWJwUVBA9lYYHwRN+lcTdbaM8uK/qlC/uymL8M6CY1OjTJs
	x2Ma6tVp9bd2UF5BVvWpdjXm+lL3ulHSCHbxAUnXH//QiHCWElz0GankipaS29kT+Gxs9bQItup
	MaQPpczQ4NB+vy+i7cBJWkXNoBhqjwmhBYTnp4+bIKDJxKEopP4soSo/cetLxxOxpuwT/YG492d
	zZCTADO2fqwQzuHISDhMK8oWbBsVmcnfY+tFoi2FJpZN9u69JBhZEBIX3+142Chqiv/+k8kCIwC
	sLMp88G74VS3tzmwQyqg6tUndKmHyrX+7ooSjAk/vfr1AKpd9VmpHoecW8MM7Oicy7kKBGtuUuA
	WSJU55EM8+cvHQn3gucfZTg==
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr1562766137.2.1793020734802;
        Mon, 26 Oct 2026 06:18:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr1562727137.2.1793020734298;
        Mon, 26 Oct 2026 06:18:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984c99sm3713290a12.28.2026.10.26.06.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:18:52 -0700 (PDT)
Message-ID: <343a80e4-8880-4faa-a60b-e3025f2ed40f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:18:50 +0100
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
Subject: Re: [RFC PATCH 00/16] Centralize the ownership of power rail votes
 for Qualcomm clocks
To: Jerome Brunet <jbrunet@baylibre.com>,
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
 <179275170360.4070168.15401690927522463377.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179275170360.4070168.15401690927522463377.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX86LKwWUUAXEn
 LPvZShnC6E0mds4wwYktjc3i8rU7CuQtqpeDgeMGBEXYnz2vBD23d+ROxGOyZ+SO091zu69KCzf
 acAAq3CmV0mfXJlwBVARQWRANXX5v+M=
X-Proofpoint-GUID: iS9Oe-sImKwZYXvDROgqgtmjRGn8Mza7
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf533f cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=m6TPRz_fCz5u_OYVIq4A:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: iS9Oe-sImKwZYXvDROgqgtmjRGn8Mza7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX1v9r1hiqeG6q
 jO9zNyLlC35+7W7Vobf4aw4IEUocjdXhdk7QbLEAD6fl1tRCsCWclbuWkd4pcdYbmYVI6aZjo3x
 Pc4NgEj2gkHcxbME6M5e7xpyK0gQbfo49Bnzo0DFbymP6XO+Zr6FpGLZnesOPSv9Tj4Uni7Qcqy
 pciUqNkiXey6myjqTwlo2t89w2Sa6YrozdRlVRaQq5VeOgw7DSt1HxqjGlXi/VLSe+H+dvqWAw0
 ZxSsIfwSJseLdxZoxukuuLPMNIw7T/r2zCMF6YiJVzbeP/Y8/xqrv9mcYi+/ztJUxt6WK9ncXrn
 D8uKnOvhSlCX6n8pMlgHLCkwBmn+lPqjVXuSL1ayBOqFd17Bel6WHvKKVgYr5krToTppO4Rwbz9
 gDyOU4Rh6md0jrCHLFYYQZPoxvBpfILGOEvG/UiXXFmB09NRklWlduUOvWupOtvQRgkSEGxutHJ
 i2wpumAyBFEeG0FyHSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260052

On 10/23/26 12:35 PM, Jerome Brunet wrote:
>> On Qualcomm SoCs, both the PLLs and other types of clocks alike require
>> specific voltage rail levels to operate in-spec, but through the
>> separation and decentralization of clock and voltage votes, these
>> requirements are often not met and are never explicitly stated.
>> This results in clocks being undervolted, or at the very least a state
>> we're unable to reason about.
>>
>> The devices consuming these clocks very rarely have their own
>> requirements in that regard. (1)
>>
>> This series moves the frequency-power_domain-perf_state mappings inside
>> the clock drivers, ensuring a single, trusted source of truth is
>> established and that the silicon is no longer driven at out-of-spec
>> conditions.
>>
>> To illustrate the nuances involved, here's a couple examples of hidden
>> dependencies, as found on SM8650:
>> * video_cc_mvs0_clk requires LOW_SVS to run at 900 MHz, but the
>>   PLL it sources the signal from requires SVS (higher corner) to
>>   produce that frequency. Similarly, to produce 1140 MHz, the clock
>>   requires SVS, but the PLL then requires SVS_L1.
>>   Analogous story for mvs1_clk.
>> * gpu_cc_gmu_clk requires MX to be at SVS to output 625 MHz, the PLL
>>   requires SVS_L1 to produce that frequency.
>> * A number of camera clocks follow the same pattern.
>> * Additionally, some clocks like cam_cc_cci_{0,1,2}_clk require
>>   MMCX to run at LOW_SVS, but the PLL has the additional requirement
>>   of keeping MXC (a wholly different rail) at SVS_L1.
>>
>> There's a broad agreement that a consumer should only have to care
>> about the clock it consumes, and that configuring its parents is the
>> responsibility of the CCF. Requiring the consumers to care about the
>> above cases (as is the expectation today) is a clear violation of
>> that contract.
> 
> This is a fairly bold statement. Yes, the CCF's task is to make it as
> easy as possible for a consumer to enable, disable and set the rate of
> a clock, and I agree a consumer should not have to know what the
> parents of its clock need.
> 
> That does not make the framework responsible for it. Taken that far,
> the CCF would become a de facto platform coordinator, which it is not
> meant to be. The clock driver knows what its clocks need; the framework
> should give it the hooks to act at the right time, and stop there.

I think we are more or less in agreement - especially since this
paragraph of the cover letter is not really faithful to the 
implementation (since the ACTUAL voting ends up in clk-dvfs.c, so
essentially a driver and not the framework).

> When coordination is needed across devices, there are dedicated
> frameworks for it, like OPP and genpd.

Right, in the specific Qualcomm case we heavily utilize all of them.
For the problem I'm trying to solve, the clock controller is the
"reason for the problems", so its driver gets to carry the heavy
wait

Konrad
