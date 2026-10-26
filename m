Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020328;
	b=kjvi+heVVcWiSC89mC6qmFI9O3dEYsMwsTgKd1xsikvZ2nmCJu6qxMmyxuvWCMSXTAz5
	 o0xBlBPlA31huSkWgBDhJxvBVWc9wCbi+0NrxctpeyvI6kcLiLA6mfb6UJpIZ5xwUyPUA
	 YMO5IEqL3T1eyatCF6w8u9W7jQZFjriyc4sJ2PlnyclpQpGNLdFf6ElGhUkAYqttaH4fA
	 textoGvT6ze9BefG+IxtCvmDMh99CXoa3lr2oesX00E2TAckiXi42zs3dpJDkihDUfHtf
	 t3YqY585GBBcug1JWpifMINBGqUpelFj19SY/hWNmSf5rUGCgDfFtfPN1L1slzlINVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=;
	b=NOtbDexxbgQuKwM70pn3aw+ZED3VPC27x0bnYPaZP8jYF3p+qls0PT6IZlDYKKXW83oI
	 1eJpvQeztZxhcLYEokV4MKNpxd//3fsk8+dwZb6poxry6pwtvHyyh0C+aC8EOSGc5Jnvk
	 0hFJg7SkrUuVloamEyHjNrfwDB6yH5FpRUVspXOmNgj93nkilvtRDnnTSjHjr/AsTZL1u
	 P5cK85BfkK7esXjeOII10EC7MW+i0hC0/KJZTuaMpYaF2Jebhew3iz8CrhDyGOnANHVIz
	 gCpZ8fTk3AsQU2+anNmn4wTFQOI/9cAn6U15C2TQZTCKabpar/EOIC6T4CPMpCdApYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMKFgxSe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwO3z7rc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CEF606A320
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 13:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2CEF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMKFgxSe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwO3z7rc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtNZ72542001
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 13:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=; b=AMKFgxSeuegHHZN8
	YrT7ACUt4stSsxsEmR90KoI/4kYGEMrx0EEbKStDk+nT3aWJ379akLCm44Gy5MLa
	xd2wBglGKOnnpfoSNI7DZb+EfSvwZf6KAUpb8spcbhZX3QRKhqXecACR1bS5nVKD
	bRX+9GJq8kdiPygSOYZYB5hTFn0meW65G9iATJO7fJAxd+PnPVaHz9VOihUx6DrR
	ZTyqWR3H3Un6NSp7kHKJSvIt+JeATgIN/NXC0LzNfbJbHqLSHtZbvxy8gYZtOXSi
	rOcfHQSENP9Q0u452Km/53tCim9tRTy5PmyPuLgLS7PRDbxbh4tIG5tasth5V5BA
	s+RD+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdajns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 13:12:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so83892985a.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020326; x=1793625126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=;
        b=QwO3z7rctoZyNVb77UyM7lmsLgdXdgja7Y11/samwFYMM4FSAgKMbppDigG+O5t/8c
         xckpr+yVvY8GOeMKhiQn6VpllR/mPIgHfAkTF5w3oMIO+/TwrkSedjbUjcwdcRpzyBTA
         /hbgATueUXcMrZ4OkQ6f/0VqxojRNTIownqld6Sf6swvYDGOqaMLLQQZ//DCRac0Geqm
         H/RlgiTp/Q8xDxjAvcJInxlI1KyHn5dqn60G+KEBEZZA5vYf6ifhr0tMYXdsYog08xzp
         FENnCpLp5wL8JI3MCeDYx1EITZD+03+wafxwy8T1otjzPacPePLMMtjOAvuQcoRt+KX1
         sAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020326; x=1793625126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=;
        b=XPt+A3Pyho3piF4hEyCjqiJGJ7j2PRR5GZ4udXtwQIh0WA+7fDIXTLYdwn/KonIO2u
         Bsbh3w6bsZ4lVhLNHnIJA4E3yYCuA7TDjotL35AEzPRMarhqC0AuVtUDgpoPROBz4hJ7
         Z+TfpEwP6nsjTsobLn/UhdCRZhEbhklXjVP+KAxBXD7erFmMFRtK180t/ltlc9ddOpPW
         CHy+1fIs4YyYkSnjhSQUqz+Py8g3XBB5Warxzh77CKtEFck+/1sHGn5NQd3rT2IOQzUf
         3GRFhaGWUEF+I1nAHCzrBD6WgfKnp8rSttWmF3qtIVlFRr+ifkj28taxnVZDrNNXMOUs
         cRNw==
X-Forwarded-Encrypted: i=1; AKwUvBwL1JZPmRiaHkbhGGyDxw4MJQt9sghzrRzxZmICiyNtu4bU1L1dE13rBl1CqATwrXnT/S3R7N/kmmU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgTAohav/Ig5ZB9RV4OlNWp8Br/bpPeNmmaZla+e19X/vMBy+Y
	/R523m7+IuRKm1jSIMCGpqkChKN06uQgYDRnFGPRi7gT8jxzNTtG7/eTkFmuD5MI6wHGyo5a5zr
	pAc15wA8iiD4Xx0NHSLx2IgI0GqrN9cMT5rmSt1IK/OuS5Tljw+kM1TI2WQM5b9E=
X-Gm-Gg: AYBFou09iBqRCEalCai/81Hmv6HVaIXgM1PB7WP6bQtiF5vf3gktrYJ8XMK0fz79Tjq
	FPM7UoCi14bxTw7Rv6bcDpsbU1g6xhCEy4PWq8YfQpJ+icoz/SiXbyLM0M4Txd/a5nMBXMDjmFn
	LbdbbPzSdGdDSL6KoV8rdcAUs6IAGZTaeLgtms6aVzoAzdw73Yr7UyG8SYP1e4UO4WVIMp1vZ2+
	Ys6WYebRJfZg5fx9v0JaF8+9XTiAeGCaaWQfnu6J75UFOXg3rg6iKM3vmrlIsDAF2gB0PU6+QbC
	sZS8YBUadYHrfx/hmFUZtmDJ3iDrxeiC/jQ/cweufVDg453ZTxSMQmI0lQf0SbbKbot14cgLbUE
	yxCWhOvJx1kai/J4a7B3ocA==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1205344885a.6.1793020326035;
        Mon, 26 Oct 2026 06:12:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1205338785a.6.1793020325533;
        Mon, 26 Oct 2026 06:12:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984c99sm3707047a12.28.2026.10.26.06.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:12:04 -0700 (PDT)
Message-ID: <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:11:58 +0100
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
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
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
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179275170360.4070168.11650113664838519061.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yfHdSoPKloOtT9muZpOvZXZFwJ6R5AyA
X-Proofpoint-GUID: yfHdSoPKloOtT9muZpOvZXZFwJ6R5AyA
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf51a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Hc6wbZxCDKPXCg-kSLUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXziqcGkwmVD0Y
 MyCizPh3pFnecJHB2aafMmMCpBZWtE+ICImtF18NUfwPD9ZZbPUDIdgxhEg/J6eRS0o/ogrEU3+
 pAqQeGkNM1G/+P3h8Cd2/fUdimUlQJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX95I5oegSgdM9
 4DBiACfOCNQPG42HgZ5wmheYVN9F3+6suHOcTUImxp1YVOr7picD7za9XpI8+PWFH4LbzUADPgb
 RCO1wa5AI9b8iP8S2W3T4BFUpNJMD4nmrcNljRgXoPZJQ9FSyvi8HPA2cgw3AZt3bG174JS+p4C
 tAuVXeSF8p8bm/AEDuE01LeY4A6abx3htQ6o4SIzZmPdgyo7je7gB1phqLEua94J41M5hW3S2J2
 AqK4EUQF2KLZhmHa4m8PHs/9g/vIUoJASVX3V3xKbSdp276Ht4phcS67MOz9u6zKif/7IdhIOn5
 Et+e25bUy/pWAyg7ZtwURdOvAG2OrLNXcyvGcaju0bdzSjKfj+njLqU3sZ1KceSiRGCqemIVuQ4
 ngAdxPBTN1dTn2gxhr5NG/eHrz6zbCrPyNZnTSeVGkdNz+kVHJQycugkjq5yRhjei7scltiAI/Z
 vtPAE2VVBOeTFSmjBHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 10/23/26 12:35 PM, Jerome Brunet wrote:
>> Preparing a clock protects its current requirements, not the resources
>> needed while changing its rate or parent. A transition can temporarily
>> use both parents or access an unprepared clock, and a parent rate change
>> can cause other clocks to be programmed too. Raising resources one clock
>> at a time leaves those operations exposed to insufficient power.
>>
>> Failures make this worse: hardware may already have changed when the
>> operation returns an error. A matching cached rate is then not proof
>> that resource reconciliation finished. Retaining a temporary enable
>> reference without a corresponding prepare reference also breaks a
>> consumer's normal disable/unprepare sequence after a failed reparent.
>>
>> Make CCF acquire the affected tree's and parent paths' resources before
>> notifiers or programming, and reconcile them only when the walk stops.
>> Keep fault recovery independent of rate shortcuts and subsequent
>> consumer reference-count changes. Require explicit recovery of an
>> ancestor's uncertain parent selection rather than reporting success
>> from a descendant request.
> 
> I don't think all this is necessary to address the problem described
> here and in the cover letter.
> 
> IMO a new provider API is the wrong layer. The framework already has
> the hook a provider needs: the rate change notifiers. What the core
> should do instead is fix those notifiers, which do have a few issues.
> You are fixing one in patch 1. Another fix, about setting the parent,
> was sent recently:
> 
> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
> 
> You want to act on some changes before anything is programmed. PRE
> notifiers are the right tool for this. The user of this change in
> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
> it, ABORT drops it.
> 
> Also, what is acquired here follows the requested clock. When an
> ancestor switches parent, the chain of its new parent is not acquired,
> although it feeds the whole subtree after the switch.
> 
> With notifiers, the parent fault state is not needed either. As it is,
> it blocks every request on or below the clock until the same switch is
> retried.
> 
> Could you tell me what you need from this approach that cannot be done
> with (fixed) notifiers?

I'm a little worried about the ordering there, since some device
drivers may also be registering listeners in parallel, so we don't
get a clean split of what PRE means ("has power for sure " or "may
not have power")

Konrad
