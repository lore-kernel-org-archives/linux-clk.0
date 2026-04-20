Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8495E248F6F
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776688300; cv=none; b=nXW+vJ3TvAop3r9JgGDunjfVL61gYYBrgYuxUqdkiRQhfUEhsn0GroH2V40Even8uv/tyeEkzvF9r29JOVLJL/2S+jLQNghpzqcVRVsHys/LM77URvUdX09xuvahpCTj3MfXo/YLX/g84ZMGYKij3c565xyiplzbe46tVG4dmTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776688300; c=relaxed/simple;
	bh=QyGU+JtrD+xfoAqSO/a6JhIRG4Nj15cSg+hd4z8eLWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/3/boHXtrwexhKBUATlGYG8sie0VmTdVSDG7i6pFGDs2HzqP+sXAQx/IHBxqGBXYMwwCEQ5+u2SK/jVvB7XG1WnchC87cxinr82TNNQL2qhCAXT+X0eNn6BwPzpJlZMa+nrN6EW1ZhF1vVWMOmUohuOMmWNaaqZrH981BYSv0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhVwzEAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jEyA5Pay; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhVwzEAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jEyA5Pay"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97qYQ1599908
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 12:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=; b=lhVwzEAzfHqo9aGe
	atEILuZcF3EqA7ImomSmqrJJaLnmSwnHX2ol2nDReWzhCnvB/ZnUBsaczHV7Sqqn
	UCXC2W12Y95QD2fFm4W4FTJ9tSjcUwmP+xH+bcDBBhirltmDd7Pc21luCz+xb5M5
	jdEWtEcIVJOdyjeeaGWkpASC84ZCeh+IkVNX4dBSzymTPbHjji5HWWLsC6W9hFBR
	CZ9UVCfZPRaqqFvgrEcOGjWcU3hBDzXcH8NsCYYkA7UdOroYYwkR2TEKQV2JwA1I
	rtWJnuSCwaKQBmPfJYbZkej1GF4/bqYtJ+WyLAyY2iOpWxf23B7se3NFnUmY5Udq
	zBsaMA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh898nm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 12:31:37 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-46f85ce99f8so1794330b6e.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Apr 2026 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776688297; x=1777293097; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=;
        b=jEyA5Paylk5AkOJM9yndesbST3nP5/ec9pVa0v2KuGTlRKrQinBkjYNOR7nE5dBSSD
         ICQciD7QnStJQ92E5G+doyThsv6xZPO2db7dfhX5h7A2Ss9PE0VqRReG9q25ayUx+0ul
         4OR8YX8X/s9ttJIAGqX4MHXaTWBXK6o3SCMSF5HTfcCyh723NBRf2ZM/Rc5DciyswRct
         chvqVrwyDSFDG947nfJs3Mp1ebkxWBAniCkPF6l7qjw3moYtyR6N0c5s/pCd+q02tJTS
         /5YQymnJDZTRn1j3u7cbqkfmSbULFXpm+AuvlelWjtUUIJkCNN10uF1fFbmZejnHQF4X
         aDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776688297; x=1777293097;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M1mHBiu2kyCdwn8vgppYE+gc92gcm7L8eP2WtHeZFDk=;
        b=LEwb6WCo/NBeMeUsJS8QleW/BHr5frNOPUNuV7u1l+KwFZHlF20TsX9ryK2xc7ZPrd
         VPCTjNy80DSn01HpwLuntpVKpWOiXAwUjoQI7T00xEiL0t/CP0G5VeYLeKY9piXLvkle
         IohGuZOpRWm5xg9L879fw9ioYatC7Paf+4KjC/govs1sUmoFQwyS6YMBxdD+wzIaQi4m
         cPAyCyUPYyYBJY71d8ZhmeLtT0tk2RD/Q29goX835C/1Aj8QjzFbCqb41GXkZpKIprL9
         YYE8WUQqrp+Mvm04poASqEDPs2VP+KPAqxVB2/zaSV0ElFJWXqX+kkXfGDgWLoQwpYKY
         jJIg==
X-Forwarded-Encrypted: i=1; AFNElJ8YOCB2w5AhmzaH14IauvwWe4FuJtzP6yTTeV+HXWvG22KjrxQR0PxFjEnSSOGWF8rNqVl8zk3lSv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJzRcE8pCUsbWBSGqR72Y/HL9rd2h8O+lWh896F6ZUqCxZge2U
	g68LbvTUmqzVrxW1DQelTWn/qWz6pNPlblO5GL7g0ry0WFvdM4LP8kUt8e6LO3UWq95CvhFhmdO
	8N3puYvie3iNsKlzDu1S5Mt114M7To2+DlRj63FPuLxB/m9Mf4Id4r944iny1PD0=
X-Gm-Gg: AeBDiev8X3DDw01pVLwYsGTA6M7G3TbRz3wx7GGPwqN1Ix8oxM0KrUnEAFEAY9LDY+/
	dl+dTxkIwRH0xBvJszQuITzZe8sosR+z9lvGlno9aHxNere5Qt9u5l0bYi17qvjo2q/JKU0y2ku
	Ef6+OozsoksDvPMJCEZ4Wi3Uxjf4R4anXo9OUFVJ4Xz6dwMqgY5UpT8Z5jDEQuWgnlHGqXNVL07
	GhLapm1/Ze+48wo+aDbMljwFGOt5O06UMn8oHAaG9G4E5jIJISzxg76iYpCbGSj7CzYsk1rpN4q
	nSp8q2NHOgNNpM1s53jnha4N5BtCwOgEs+zzW+c6TrnrISkPMKZ8PCywAC6rdlFGC5JjDq6ViYl
	pY1Xl6ZE9OQ256YnLK/Hnm3fSilgVszxwb44YCoQdxUQcVw9gw7nc8C6ZUOCgVY6BpypPfxTekZ
	Yj2YI5OTMI3VtkGsWYQCUQ/z4rPATxwGiUJGKpQ9IXofMFtQ==
X-Received: by 2002:a05:6808:4fec:b0:467:2509:c20a with SMTP id 5614622812f47-4799cb50f32mr6675103b6e.47.1776688296819;
        Mon, 20 Apr 2026 05:31:36 -0700 (PDT)
X-Received: by 2002:a05:6808:4fec:b0:467:2509:c20a with SMTP id 5614622812f47-4799cb50f32mr6675055b6e.47.1776688296347;
        Mon, 20 Apr 2026 05:31:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187ec0c2sm2925137e87.82.2026.04.20.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 05:31:35 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:31:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH RFC 06/10] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Message-ID: <aktvbu6ckco2zfmt5pxyij52q2w6olwwlg4ziuqbdya7vrtxmg@w2rizg5zymhq>
References: <20260416-msm8939-venus-rfc-v1-0-a09fcf2c23df@gmail.com>
 <20260416-msm8939-venus-rfc-v1-6-a09fcf2c23df@gmail.com>
 <0a5f9bd6-d3ea-4819-8be3-cc5a06ec0339@oss.qualcomm.com>
 <ad482bdd-2fb5-432f-be1d-dec25d9cbf5b@gmail.com>
 <37poakqgqhsuavvrm2dyzwk36syyq44o4cfdsylkzwsupbh2yt@ycdvyrxgnrcs>
 <a09485c54946b754741259540257393734b518c3.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a09485c54946b754741259540257393734b518c3.camel@apitzsch.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDEyMyBTYWx0ZWRfXwswz9hKFha4j
 cjqGWfnNKoPY6OAXnmH37BJB6QewGyyGrvgcimz1QDzaMIfpFzD4QRaeseLbBiRP3i+aF0DZf/L
 qVkJa+YWQu3vkB/FLaKDRnD4bAV38Z0nOZmMA7IIt8wJ744L4YIeXhDp2U8hi3GOqDZnmIZpyQS
 3AMq0nMBj5BpwWUyns93OEm9qxSuX/O3PSmaQzhlwutwv0IqOPO5Tumu0b1LmIJ8I17IqKDAq1m
 6XnZ7VLB4/gpPqxLOOaXvagMi5HvA5m7gyXRODI3XNwWwZiu9eULD6Ydk2bgyS04DLByqHPQtqd
 ZkPfiygmTNrBJVQxrWr8VpY2yGX+mbgBOhcMT4LxOY3caMwDk1add9Xgzv+6xXvMgoxX4/mlD0O
 32oNZ8cbhlHEgimkHcKFkJ/XTEtQgF5YNLLEW7KOb5BvMnc0FZp6AJSxgVXdjRvPp1bcKOLWDyb
 cJJaFLUwkWADSy8obqw==
X-Authority-Analysis: v=2.4 cv=D6B37PRj c=1 sm=1 tr=0 ts=69e61ca9 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=Jn2JxawGAmoOaafwVl4A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: 0VmKED6Nwy8-2zeQaSjU0yDtsDhf7I-t
X-Proofpoint-GUID: 0VmKED6Nwy8-2zeQaSjU0yDtsDhf7I-t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200123

On Sun, Apr 19, 2026 at 10:26:56PM +0200, André Apitzsch wrote:
> Hi Dmitry,
> 
> Am Samstag, dem 18.04.2026 um 02:40 +0300 schrieb Dmitry Baryshkov:
> > On Thu, Apr 16, 2026 at 07:57:30PM +0300, Erikas Bitovtas wrote:
> > > 
> > > 
> > > On 4/16/26 6:17 PM, Konrad Dybcio wrote:
> > > > On 4/16/26 3:43 PM, Erikas Bitovtas wrote:
> > > > > Enable Venus video encoder/decoder for Asus ZenFone 2
> > > > > Laser/Selfie.
> > > > > 
> > > > > Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
> > > > >  1 file changed, 8 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > index 90e966242720..231a3e9c1929 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
> > > > > @@ -267,6 +267,14 @@ &usb_hs_phy {
> > > > >  	extcon = <&usb_id>;
> > > > >  };
> > > > >  
> > > > > +&venus {
> > > > > +	status = "okay";
> > > > 
> > > > You need a firmware path here
> > > 
> > > When I tested Venus on my device, it loaded without one specified -
> > > msm-firmware-loader creates a symbolic link from modem partition
> > > for firmware. Additionally, none of the MSM8916 devices seem to
> > > include a firmware name. Has something changed since then?
> > 
> > Us becoming more strict? Or more caring? The default file paths are
> > supposed to be used for unfused devices. So if they don't work with
> > yours (most likely they don't), please add firmware-name:
> > 
> > firmware-name = "qcom/msm8916/Asus/z00t/venus.mbn";
> 
> For BQ M5 (msm8939-longcheer-l9100), venus works with the firmware
> provided by linux-firmware [1] and the default path (here "qcom/venus-
> 1.8/venus.mbn").
> 
> Just to be clear, should the firmware-name still be added in this case,
> even if it is the default one?

No need to, but it would be nice to mention in the commit message.

> 
> Best regards,
> André
> 
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom/venus-1.8

-- 
With best wishes
Dmitry
