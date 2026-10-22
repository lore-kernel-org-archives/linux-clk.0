Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653752;
	b=IlhU5pS/+uJ8/k7DNNrh45LFHS/ij54bhOAfcrUTlMTNY6n6DUAf0zSP+ms4816EKFOe
	 f4nthskx+V99Kw82z8rcOFawm9yhn1qdm3XG2faPJuduoMFsB2Viv6woRDe85MU50HgOu
	 tHTuTcGTQMHM4KMZL8GBLtNAGDhMvnp1X5Js7z9SfLYienMiEhNRmd+FeXwucRhn3MmQS
	 gO1dXBNPtfr65RufPbmq5+ULdS1rCX1r9i9JrZRFOilzDj82D8iR2P3cDMQQ4ItKe3eAU
	 oX6+2X612FcWvs1MbsEvns0QSV8ayU0Kp6Lf4KmIlVwlRpTlAFD9+TqG0DpgVmS3C7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
	b=0K6STc5mgmcve0AxZZlNEuQaM8sXLPll0qQcC9AP3kRte3zUkMyKxe9YWeoqD8MufmKV
	 B72o4KzXgZ0fWQKPROmNS5+7A4skPL/dzRm3tr7I5lQafnfism1xonty6nb2QBkYaoDPK
	 YQZcuLWM7HlloqIXe4MqvM1ieamwsHikGybOgluj2pegtO0MkgFlbfUMCeAQVSTsVevLa
	 6OQm2dFgXZmohSHLyy8wIOT8O+tpc8G2rIwZ4iDaTvMdk8LI28XcdlfCAmSJc0/sE2sx+
	 9Kzic9PPmfY1EpsoWVhvtXJd+k3wfgK2AfS9ovY8cgXfUjS/2gR9akg0B5UPQpRCmQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ihgv/q3G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPubOZCR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6364606A323
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6364606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ihgv/q3G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPubOZCR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M705O84110647
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=; b=Ihgv/q3G57uNVXCw
	80iLuQi0Sg1ExxGXzcaxYUxHWIj4JYmi/3xXoDzfYN0VxU7u1hxeKtNkVWvpwsOV
	ynM2+Q7N0zEjljMGsMg1L0Co3OmZp93hQayYb2snGv8sqHnoXT4ZmQ0ceGjuX8Kj
	J/zPd3fYkZaCk6CbCygkxzpnzE2HRDgmkDKHb8F31TKU56gWvFteFr/vyJuRPmOS
	2wJ7VAFbLzGJo2YjqdFfA8rywdG5wCJnRrWgC3IZhs8mpdGz0MhkHf9lVdsBLauO
	UJx+Gog8qKH53Fbut9RaZr4pN2Ufe/OCKcGjZYu6XjUBrcB/hmQrAW3aPoZnWzZ6
	qsIjbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ah7ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 07:22:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso46169185a.1
        for <linux-clk@vger.kernel.org>; Thu, 22 Oct 2026 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792653750; x=1793258550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
        b=UPubOZCRJPF+Ck6OVbeQJrQkMXKWKRmOZhC8zyJrVxmvj9DEUd0AXpXeLj2AZshleJ
         9IrZG7xuQv1XrYltIt8/xiKcP2q7VTAmI4zPZ9ZvoKNNqr76igDZMLyzqTc4RnOtWJVJ
         72xgwZpjnbqHHNhEH0NLcN9GiQsFpeGEvRsxOkI7KVQM2vnXOsKvYxUK+BKUYqV1iBXx
         h1ATerG+iqRgVe4ItLbixZOm/ukzMk42zAFCa3SpQmlJhFkhCFmAcqrYVpspySw9ElKd
         3eJEjTPXW0KlOCCOoC786VKnqW/ULg3kOhMAeyuutMC39IYBmBo0QXEap8VnxvQvcat8
         JnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653750; x=1793258550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
        b=mBMH4bWG0ZNhuBJ3fALViuOSG0iEkCYSmdppOlaGXSKdhML+kg5lehi7b65KgbtAAl
         eqToqMd9rXbTp39ipfUMrIDDVXQuSNJ2tmnirkj49fiBfK9KmptPAdiZuITjRldoC8e2
         9yUEpm0bId4sgJnnyDJeUDgQIc8inH0N3iND4Gi9dtb463LqQ4LNO4PW0GMJHwzPjxsj
         vUHXn4JfGCmm1J1QGQqA49nKVGjiXpVQA9NqlfRChG6BZofxPjSEcOiVGU8j4B0FNkiP
         9EWjLXjcOg54m8dFsHqUQMXbzzNZjv7Ymo14c6OPCXu+Np20uubgSLP7oV8sXrNbvCTr
         2TVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwECnXjxrX93tWV630FO9GedkhD8ORfATKIn7W4F64BwjKd++vHFLOR6HgaEJCyTcA4Keb7QZlxQGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9q3xlm6HaPfIeJjhQwMrvuYBchaN+XHx9PiBlVqVqr5r6zKix
	N5e8XrxvxeSKWI7KiPGWKoSXM0PblHAF+NGa3QJBVjriSaFCmzrS3nddlDWreIpq4LH5Oj+cuag
	arIAz7wIRnq12k1BDuzSged4YPEba1QQfSb0/VTMPGmLHnzpQ1z/HuHRYAyUj6x8=
X-Gm-Gg: AYBFou3HVC3/+HgPMtMuuuyvu8l1ng9dsL0N2qiEaroVQVw3KNwFYBDWqkFzG01LW9V
	DK+odMuBSb13VnhuvxqhOyJ+Fpnx0ijc/ArSyXL3p5msxGeBOJIiuvoAfZiqSKd70fA+lMiQX0e
	h4ULKOCLoS1GBPgwZPrGl0Ki8w6v6koAoLRwI8JvLXhQfb9TxFLcIZrSvTR0/xWRjiuIrAschCV
	3BYn+uCGAIJXnjSKYnJA6i8R8vRbfTB6iOzWj9GVtbmiMsXiqb2KbHOTrVm3ecnNTCux9cgVsdc
	lGfUYSc76c+HaQEJEbxP0ZBmjYrBV/QhofT2yPVBRP3ER9dIC37cyRnusFhMd3sGCkaTcbCNmUG
	zCTJkgVxv8dEXT34kAUOS4g==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr923299285a.2.1792653749741;
        Thu, 22 Oct 2026 00:22:29 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr923292885a.2.1792653749300;
        Thu, 22 Oct 2026 00:22:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f29aesm77548366b.11.2026.10.22.00.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:22:26 -0700 (PDT)
Message-ID: <11d992ca-f666-4a4b-a511-ec12335e6960@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:22:23 +0200
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
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
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
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
 <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
 <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
 <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyOSBTYWx0ZWRfX6bzIOWZkOtjZ
 1Xj3P+qKP0/PgmnGubN/bYserQgqyevang/a/VRGBkfV00+gqi9gxSSZ1ddanouCvalfQnqdOar
 /USNs9bMk4gYxu4DHIt8cR+Auecsk7OToVLwrHhgcya9VondkyJLHWKT4GJZ4UTsRiCoJAdisKu
 fXGLbva8/boEZG028P1R4/HQZFAleOCrBrByIGkZaguZTB/1VhtrX1QZxAvZMwjo9q4ClK281gE
 ZEte3HJ2R9D1AjN+JQTVTRoYJ0bDO3K1vx5KI1SIlN9VmVRL2/i1g7RXEVWgL50pMY89ffK+3IC
 n4OygeOh0IxJj/jzXXtyelQ8Iu5YTr93896ILU37o8eVPM3Ek5E3Kjv6YznZyrR+QT1s9B3sAkZ
 +qu0NlRxsuKctFsnGUZPZFEf5ODhwWFU+4y5QMtTinuOM7NUEGZ/NU/fMCsiA/JFp8Z9LwuTuO8
 yo3KppgwknPy+Fdc0UQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9b9b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=NNcpZA-_c-qG0gzoYGoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: fe5souJc0zT2d5MxsbzvJi79MeJUpl17
X-Proofpoint-GUID: fe5souJc0zT2d5MxsbzvJi79MeJUpl17
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyOSBTYWx0ZWRfX3xHa3q6B5ME9
 0DBX/EJxgwrqvBdQuXqzto9TX0BUr18WY/gEzn2VV5vfGN0JyZPz1Kzczbd+aBw40mPsnNpkdI4
 qPESd707o3AFC/tOS+yBZTKQ7xaS5x8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220029

On 10/14/26 6:32 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 06:14:43PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 3:35 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> A failed OPP transition need not leave the clock at the last successful
>>>> OPP's frequency. If hardware changed before the error, the default
>>>> single-clock path can subsequently skip a necessary retry because its
>>>
>>> What is a necessary retry? Shouldn't it be: try, rollback if it fails?
>>
>> The failure scenario is:
>>
>> opp-table {
>> 	opp-400000000 {
>> 		// low
>> 	};
>>
>> 	opp-1000000000 {
>> 		// high
>> 	};
>> }';
>>
>> 1. The device is running at Low. OPP caches 400 MHz and the Low OPP.
>> 2. A driver requests High.
>> - OPP raises the voltage to 0.95 V.
>> - clk_set_rate(..., 1 GHz) changes the clock, but returns an error
> 
> I thought that your previous patches actively target this. I.e. if there
> is an error, CCF should retract the changes for as much as it can
> (assuming that there is no extra error on the reverting of the clocks).

Right, that's at the CCF layer. OPP also has the same problem and
needs a similar solution. Perhaps once all consumers are migrated
to clk-dvfs this won't be a problem anymore, but that's Qualcomm
only.


>> - Assume clk_get_rate() can report the resulting 1 GHz rate.
>> 3. The transition returns an error, so current_opp still points to Low.
>> 4. The caller tries to recover by requesting Low again.
>>
>> Perhaps I should have included that in the commit message.
> 
> I think, if something changes the state, but returns an error, it's more
> or less... an error. Or a bug.

As we've chatted offline.. you can try to unroll.. but if you error
out while unrolling you have to unroll the unroll. And if you error
out during unrolling of the unrolling...

Konrad
