Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB07A48A2BE
	for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2026 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525562; cv=pass; b=rSTBuzJ6zZYCJmbpVMLZv/s77CNsDJtSgHp55IOUGt+BNJ1h0xHaen1Y11LZCKCnnZCjT/U5yWfsJU/fxJorHsQsaYMdOcHjFjEJvUVYhHjDN2WdAUF9Wf6V35zXbvIRte9hY7sD9emUJFpUrNYUzYC/zPoi2lXxW7UnSxtJY2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525562; c=relaxed/simple;
	bh=VUcBB0vOW6MkjtjLDRFaCy6FaOEhAXU/YjiYrkHQqRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/4dmyFOb1rzl2iNaRf5iPfpQOqMOedx0/+sK04IPtmHk6KRqo9ObAVdPrfZWur91OjEYP374Q9e9uEozyLYZbkNrnuWLhDdH16ts0zdAePxPf/NYtOKNwU8wO8Ueeb9HXpwTw4BTy8Q4pVoX5oVos7wlZMDbRgWmPsa9A3pBkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0XJ4tXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bs6ICLq1; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0XJ4tXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bs6ICLq1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIGHN2616090
	for <linux-clk@vger.kernel.org>; Fri, 4 Sep 2026 12:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=; b=K0XJ4tXGEidqOsXZ
	b032oR5V1rqvQce0EcA9gAHTKUvpdP1vfUI2NvqJy9w/gP6XHjbadQgX9dOh+sH2
	U0udof4CD8CAWQvCHepl4wCV5X3ApQBfEkUitnWsclRsnOxoVB+V5GMzJ++6e2Re
	3mQUMOjyswcZbavDWSMq4x329nxo9nfG2K4bI5NTW7pUROmGarJHDQX5Yx6XXn7A
	hGQSNZhHyd7cmP+Qf4qbuxe1qskxzB/YsHswpsfOspQ1rDXbM/FcVJ62NSaVpeAJ
	azWw3CIV/wasFEdMSeRe759zAFUe/X8vfVoeVM2jXo/U5ZMfaNS//ACUzGzVRc9P
	rLTDZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp3gc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 12:39:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso23011541cf.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Sep 2026 05:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525559; cv=none;
        d=google.com; s=arc-20260327;
        b=rYv2rmo753zb3YKggr+jIk2QZvY2FE4dB5YDxXWQrLHdGG/2rAJIPKzZne8Wwhf0q5
         GbDF3SV16B8IKkw//ocYdSDuf9SMm6LP4bds5yDI3DuNQams8ys092jrYX4B+CEjP1uf
         i9O+ZVsALt67x0zZLkMYXvuevuxGXGS7/RFViTtha/d2bFWDoGWlbUz3TyhojHZvACuH
         YtId6rd6bfHNLoR3MJnnoSzoYJS62usbv2gyW/JYGnEaAJYPkOGWoRh16XF6B4mhKNX+
         4Y6YOO1qelG77s9+S10NoZZCc2FOdI/e0/NuGs9G+J6AvJkXIgNDtyN6jp3oDCUUIB9m
         Ixzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        fh=v4CNJrohNgivN1Pqv511aExK2cZ6cSIh4S+q+Mk5m0I=;
        b=auonGhJVg1OQ7/lumMG1lNAwvGYA03eXcs54Ub/i4VcQNjSMak2FUGDUBZhlI1LbJ6
         JtS/KCWJR06z99r7UEUzkXCD/EVrj3s/zs72Ym9FuoSFood+f0TEtAbFoPNrW/aNNFYr
         v7WOToq9xMbZ6LVxYvRHI+sSLj0mpJGoFuIcnNPAcd0+G08fl//aFSkanT3TueFAOEO+
         4vhoYPh+kFKdtco4Brq08HrAB49xgAMj34V8iml/O1ev7pTXVnuU9F91yAK9iO0Mrv7c
         jFivpHhXc+FMn9ZLo2HiMvXOjGFDPeOzhL5F/6m4QNpfrWMyCvwc5ZzQ49AhRisgl+uS
         RBww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788525559; x=1789130359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=bs6ICLq1Rcpo6h+NJ2NAsIwXSG8ONm3ZBYr4slddu1Dj0FY7PzwsFcqVE2iNOtiu5Y
         nofWPOHx3vrWyr9cRT9lEh5CvPCbxV10P9AccSVmu8DUIOD32F2iHYxrrGB6SOodrhbl
         tUji8woJ0E+7WI2yWxeGSuVwEt75H/NoQAkweFbosavuNvk2nqtETGni8+/ORWTQLr9u
         fBDkIiWgUaiFOINw2U6xvfttuSJcxaq64oK111DpDa/GkZeJpiaRuCXFomuDFsB/jiEM
         1EszKH+jPwJjFXjbzrOw5uOYKqGTRC38BRtLGjCArL2e+E8Ny9SmHZzF/61y6/Icsu9E
         5jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525559; x=1789130359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=GU7k1gMqpaSkHdfRC+JOhf9Yi8mY769xej1Z+lADvdBGZwbLtNC7IQKnz5gKGXE/Iz
         UilihsRhWOxWzLh2+5fQCd10WFRi73e4RrCE67ljtW0hzS4ar9VAc2UW7FnNVmJqWtcd
         a4WSvvwzLtOe7ztRTZfUabwhak/ivv4z+OVZ2vtM4uaASONRRI9CvehBVmfWRB4j9Y5q
         5s55tvX+F4SyxW5mAHrYh1A5GHpA666jID0zsq+DyBTSvzNMyS9AlVuw+eVhEqLUQHok
         l0F7E63etutTJJo9hWdeVOxD71kL0nKamEP58vzfA1TRWjwur2+MhIuHNYzdeW162kpu
         Zj9w==
X-Forwarded-Encrypted: i=1; AKwUvBzBJTpIGm7chnck38UG/nvQELWnG0GuUfqUHJa2cladPCNKL+Nv7Va44zrMmCYtDuRh7yL9YtcseDA=@vger.kernel.org
X-Gm-Message-State: AFuF++ntLQcg1rGFXqkLJpttwB07jzWR3IEEPItb2rDqS8hDQp6SPIj5
	RvzHQxaEIDH2eUEbgnzzAX65D9B41EwkKI6MqIcYg/Ay4xpfuqYFy0I3V1TshrnSqPOGJ7A/DGD
	cBfkvOUwhD6kGkYDtNd0lS3/H1ecrsw9QA7QQeHc9Xl5t4OIez3UwSxjVhRAtGJixA4d9ncnzHU
	+zvv+dICNysLlwRdl8TtAnlyya7ldaNSISkNZaxg==
X-Gm-Gg: AYBFou2RXLJ9Lsg8IGy2NtMrnyJm4ox8lciUAVh8lMnfyF95Q48Xju0/7Sno3VbrI3N
	ADd/1nHPnGa5/cumLaf4UrvIjy36E73VAtsWKztmK6vb1vf9bDsElP5vpcPE+N6Et8YNrIthU9M
	l9FzRRDvSAKW7n9I4qaeCGTXO7tOdfUKn+7+Rfw3AwEDtgRLGSIQxI7sZNmxVyZ7j5fuQX4Urhd
	eFNKbFRwhWOnvt4zY02eNxiJahwA0aWh5u/aDG1OcvOUJhzxQT9lZm/mtXocSzrKDrGR4WVRaus
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-530549fd6c2mr61916271cf.36.1788525558781;
        Fri, 04 Sep 2026 05:39:18 -0700 (PDT)
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id
 d75a77b69052e-530549fd6c2mr61915361cf.36.1788525558050; Fri, 04 Sep 2026
 05:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
 <2aXo5I_5YqQ6uikqbIOWs7L__EwJV2oTs24Jqa-YRqGIU2FOT1O4bixGBbTzbaiBuENyW0XkWbqAJJQnxgSnWQ==@protonmail.internalid>
 <CAFEp6-2nWfjF18R9pw0xFt92GcPORKKa+ix8czQ=m512TYuP8Q@mail.gmail.com> <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
In-Reply-To: <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 14:39:04 +0200
X-Gm-Features: AcwNN1Xi0ZnbHcNu1xFGVtcHdZiZF7hrQekcNJq1YSDgANQhTlSn5NmxIbSBScw
Message-ID: <CAFEp6-2_XTMnxqcoNFwu=BfWki2U7U=iuQL8n6QcR-CZSMsX-Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] phy: core: Fix use-after-free in phy_get paths
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 97DfR0CuXZkw8fZYrlTkAaIZrF8SBh69
X-Proofpoint-GUID: 97DfR0CuXZkw8fZYrlTkAaIZrF8SBh69
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9abbf7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=4B6qI-Qak-9ifnyKK3wA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfX8899cd4CZfgw
 CR+jFr5C8RdTUcpTVIEql+yjq7Oj5uiEvG1PodaABo0e8USv+3+WP+E8qK8iDPOzNvj0xK/+OBC
 Lxk82d2qiIajyXchIcPlsIIXdWxMD02Mbl5FnPmnV88SnVoKTxgbBLmzUnt8S0Dq1wM0SUw6JWl
 7aHuSOUj9RZYbk4veOb2V58p7CzyZTquI2APN0ZrMSfCkd9R2MkeSXPJwhrlD6XymRiMY/ILNUo
 TnMsejJpayp1RNRWbmEuDIGjMyku/2jVAdxoPCc6UO+eZVqcRZx4EkQAk+MN4MicIOPd7ikHp1g
 sanpO5QrRJFzT1XE4ioWyEQglwC1yleTi/Vc/oViNj01E1Z2TAYqLuAzsTFs/U+oCf0I8mSs8yI
 /tyl5krjQcn32I2SguTE+7E33WhjMHpt1AQnLj4PpqcL8Z2nT/T/pdqQpQWmhFGPbhFZSiLHDbH
 5Yd1VMHD/O8g9I6kbew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfX1+csAKFkvvmE
 l4RC+oq8m0AaFJEp+i/eND1yaT6Sn/cSRA7oJjs9M+QGhxj3ZqeP5k5xk8vsnXnGHXZqTcQYiLx
 qWm8/wut7L8t7EGDM5nZInRb1SXK2OQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040114

On Fri, Sep 4, 2026 at 11:41=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 04/09/2026 08:45, Loic Poulain wrote:
> >> -       mutex_lock(&phy_provider_mutex);
> > Then, now we're moving the responsibility to the callers, maybe we shou=
ld have:
> >      lockdep_assert_held(&phy_provider_mutex)
>
> An LLM suggested the same thing to me but, I thought the resulting patch
> "looked messy".
>
> Do you want it added, its only three additional callsites.

It's only a minor suggestion, but if you end up submitting a new
version, it might be worth including.

I would also probably use a scoped/guarded locking pattern for the
mutex, as it tends to simplify the error paths. That said, it's mostly
a matter of personal preference, and some maintainers prefer explicit
lock/unlock pairs for clarity.

Regards,
Loic
