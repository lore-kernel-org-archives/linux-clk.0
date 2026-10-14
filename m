Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A191026ED3D
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991394; cv=none; b=Ct7oPvvkf8CEpAR8UfXR+tQBBLkKcsTk5BByHrFTKQhvmhThNJ8sKYCL1uHcrC6M1c6zpMVEAjJXmeiZMx8WbrGHgAO9chKm0gWYmdrQlda/gzdfgXa15mzjI+/zdge2mBGkjBZQ+wyM1XI+8fG2XFrrMZGvboEa8UMlyRXxlPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991394; c=relaxed/simple;
	bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lv0HJ7RiuL0IUmZN0QxQL+sYxevIlZncTJA6VnjAupCDZYtqoiVWGtuFFW/V3gi6Omh+Uo5eWr1bueiEsq8NOSLlwN6n8bsb4c8EUxTLqtsJXDZ2hIQLWZew0aGLesMpz/0lrh7W2CMWGIDQAVQH+X92eVm5yG0beQME0njF3bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFbK1YyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JdRiNJNt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFbK1YyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JdRiNJNt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEcZ5V3209465
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 15:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=; b=KFbK1YyAk2uiYjsb
	uu4AAULQUxgDXyWgiaNDvbRph6/UlWZrH3ApI8eVIJgX9xdOnjfXfQksAuHcT+M5
	SVrCo2qhRrqADx29GQV37tgKSQaKNT2/6ixn+eRerddPtJhuBqsM38p/gyJZicai
	KbV98rVTA9AKoew+5fNnl6oeurINPpvoiGUy/NBw9LVv3lZYEG+5UuG6DcqchanZ
	WIKAH8hRtD0vKSSKgmKy0hGLT9FlPFdF9Bz2z/eFFCYGw2VqzfE6fF4DHRRRWRR/
	11wRy+AQEBf8gG1VofG7d+UpFSFFqMA+v2Q0HZT/IXT392so24+3NZO1vt4pZxX3
	eHx8Ag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6c567-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 15:23:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso76266485a.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791991391; x=1792596191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
        b=JdRiNJNtH/3ziQ8EvrwFXXvJdnyxUpTMzwsyunyiEa0jpjZo0h75MGxzBhl4FSR5+q
         7dnjW5o8UoQS5nuWkHzrBqZBP09scQpXeEffNV+ZGG3EgDgkG5EbLTZl2XURUHSyOJns
         pxODgoy5y9TdvokvmELW/jte8qpGtxE3jd7Q7cXBmda2yoOvnaL8Sf+2rY8Ds5nO+WeB
         hDyd4PaYaTmnJFj677L+16iEeg7neZToLzqydFy3C02zfT3wv1+Ky50h4ma5kOUE7uaG
         6R8raONwT8OWxa5t8GO6hOv/XoVQVabPc3Bt8rvykd25DVemXZPJoTGYs/IUqS2bbDW6
         3oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991391; x=1792596191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
        b=LKjDCazpiTnEXZKx1JTGEer54OgjvexxcYTZowO+koGE+fjBDtXNzfYr9HJq8/f47d
         Bs+//ByLPwp8BFwGrZZcN/hfMrxjykcYROxakIH4ubrsISOmi1T27wxWfpWfgUnblet4
         /BO+F7zyIIZIHPqNjqrKdBgSSapJAQzKCEyc8zURI+VEsuL4487KTUc9Y/5B/fToe5ER
         uGRERdNxXw0kMnoNy3EAd24q0t6sXKMzUNx9bKp59rC/4HGQsNiufz5/1CUd1s3aTXn3
         TtgdpeyI4FOJ3+QHRAgRiM79GCPcXwhH+uX2U8uvfDqK9NKAW4Fid4RI2a/O0HpPC0Sf
         PBzw==
X-Forwarded-Encrypted: i=1; AKwUvBwk72qW4F5RFcs9cLA4RgBMnAv9HHQLRyTQNdJB002YFdq4HbPRbNOqgeixP9Es/4N1ACty2dXOEYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdlJZKdMs1j5P8gysk24oewNqGM8XnluuzlMro0cnPXWH+7q7g
	u4sUBOcw621Qy2lc7gyCOa1ZlCc/netuebG/LAFMPBw1jrFoMlXJHVy16rLyeWjqs6nGPq16inS
	R8w9+4a/iBPlKfM+nUsKTI2HTJliicppQ5+43suzAA587TqBJnyvYdYRUJMk5LKQ=
X-Gm-Gg: AYBFou0U0f9Hnfoil8Wg3TgnohijHjrBuZNoLM+2l9AvzcLNcUAepPfSpWwqjw6e4PC
	PM2LEqA9WaMOD56Kf+KZYpbrfpMhFMphXGV7Kgqa9NwWKyYFx34Fe8LVbnPfw4pzLMQun/+SmjY
	Gc2w/oyA58Bd1GBqe6ue+gvrWN6yXMX7Xh8nfktgW2xrEmTZt7l1TgLbuxbd4mnJh2wYYqLviUD
	GFFRHfhVVBhvFVCeZbge1EagLEoh7egisK8g3QFE9LxsrBfeNvdc7JEwXHxUS2r93irdih9mHSj
	zua5ARVlrdpjHHaq0k/HgNnpxhofhNDcLLC7/Xj3SjI8RAPkGeqhiPDsyPxwI2ByXb3jyyfcvsU
	Y//mvuFdqA+4IXOy2xm8ccw==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2689953085a.0.1791991390513;
        Wed, 14 Oct 2026 08:23:10 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2689944585a.0.1791991389881;
        Wed, 14 Oct 2026 08:23:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20383a22dsm1269905a12.6.2026.10.14.08.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:23:08 -0700 (PDT)
Message-ID: <f5062eed-f619-41f1-9e7c-71a7405e34ac@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:23:04 +0200
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
 <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
 <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1jPzIzvKMCihimILdJeHf3EuvYr4mE5r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfX5K+UAfnWF7iY
 FD4DycWPIZG1l0f8OTF4pTOlvuXPxSyuoAb68v27Z+M9R2dBYz/m8tTwzrXrwTgpxo+5q9A6qgC
 tWMlHeNKSFwDFn9o9cd3WXTY0K1HYPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfXwurmuALIHywA
 cuEJr9ua8vhUq3cvOJMkvKfUmQ4cmTK9vtOvyaqSlqjd4nScdsbRzMg0FETF2jPAL5KVeZsqDQu
 iLCYWm7l3DO4s8EmmI/25l5j3hloZfWf679RSxCyUpiITKk5VXRiQyiYoHAmEBT1sEejoZiv80M
 Hf+mEXrsCD82GMDPE/dVnttXBmJkax5TajAq5ljf0cCqVBNPgQvGgVwjXcDaoRkXk5elpICKihP
 AMNsthSB7LW1IyU3xA8ZlEc26YTOWOveLGIXZto3nXAZJRl1HdwoxRCg892xKnK6H5SQuO+BDHB
 dBbukxPhRVr1s9z+ZO3V+BN3R/hb70JtS7+FgenEkZAF8S2hBD/B2AF+vJyNi7MDhjERlPotZFa
 V0dXzUEJzn34KYYEgedWeF5Ajm21JcmhgaT5PXfiM1MPf7GasohJYgqKI8syRRVgioCh8W0s434
 vKmHKqZboIG7PB6z9cA==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf9e60 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Y8Q4aqK4LaMswZtuF5kA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1jPzIzvKMCihimILdJeHf3EuvYr4mE5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140061

On 10/14/26 5:01 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:36:11PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
>>>> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:

[...]

> Ack, I missed it. The price of doing OE instead of kernel for several
> months :-D

We really need you back!

Konrad
