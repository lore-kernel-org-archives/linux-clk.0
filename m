Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20D1347FDF
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774651716; cv=pass; b=bpS54RT+5MoKIcoD62xFKQE83JS2dZTIBHbbDZDcHXbwvX+/omENpZR913yHXMNyvwWqLUv0b9DA+5MItdMZtkWOzkP+p00F5gYvXn8iTMU5Dc0lqAOFkh3p5o3zJN6RNbpbL6vzJdfpzpUHc/NGwcCf4mFIFL279QncEDv8kR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774651716; c=relaxed/simple;
	bh=O1NKOiweRJjnjoPU1WxUJ2OHjCKtZyFHqNZw59QAu6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocukmkoahOEsgacUlR7W+mw0CA5ZnDqW8j8iVQMds9POB/t0PK6ryxfD1W5o0N81X/ARid+gtJkDyBHKylJyDJxwg/s2B9iFfG5Ir3+u/uK6H26CPqTu04+u5hQF6IEfsIE2uWbV0DJN9OArIHk2AtHUSIRdqNTGEjcG7CMWp3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPeJjtd2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e6CxWZun; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPeJjtd2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e6CxWZun"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RLfpHe2689265
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=; b=PPeJjtd2pfiqnLS/
	Jq8Nna4aXwsTQmqjKuGssdXhoIxVexBOzodyMJqJltnCu63kUZIZLdBaMR37lMn9
	4JphGMOQ/U9bW0W5CKNH48pPX6+SF3qCfE/Ci2Q5L+c/uLVy3Zq4z2GGA8x6X784
	v9Rxl1SI1s24VDZ/q7PzOD7A90lLWOpMzrV9Vf+kyJYeLyBzY484Ywg0VWfIDk11
	anj27futnyjEyJnqdyBlMPlXCTa7cNoYwv4aTxItJJGYv+R25W9R4fTO456jpG5B
	J5Ao+vPRDjtj99C1pfRmfOFt7WnxA6idSDbe2HpKHCFt9nHpuyqjaFImEz4TuBPv
	3/cE5w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5w30s5pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 22:48:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89ce2a7fef6so7928456d6.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Mar 2026 15:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774651712; cv=none;
        d=google.com; s=arc-20240605;
        b=k3QGwhOVvcdeHOIf4NfaN2uHXjdXZ+65wIBzx4ImCCv2CRUPR3Fv72ed8LBeoR21uw
         kDuxyNvTcT+MBQo359/Sat4Lv6o0oZV16Hj/LgP7VwYbHyCQ+tQcyvFyuNK8qTaFZefN
         I0BEZ+/j2Y43vAntfsOfVxiotlzQ9sUY0C063H3ZAgf/Aw2O44XKPun5+L/81JBlZoP3
         2v/Ss7bbISdQk6qN2oAZqCV4QgN5ai/JFBbQARSPmwiv2BXIImOcGpH2h2hvzTE3GC1C
         YEJay5c1LcfACCX8ZWHJmK1PSyeKZdaYNzRDAo3N+0pnvmctOpXMsU7jbCARbAyRCmGN
         2PLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        fh=PYquzTVwJerIOLcL/a9c330+a0hg71vtmYaU31RmVTg=;
        b=XnnNX9w7XQJ25+uA/gxXWfnNhkmy06tlw60zf5ZrRS8Z1Izl9fRm719Ue9bx+JhSIT
         SnkkSf6sN79rApdOfFKv/ZvrBrUyo71mS2ufUNW+LI0cXHZdabzRdCJVxv9l2xgvIEjE
         nrLARhicLXTRiAOEOPfURYIkqKHA7348tTtvEOfNmyt4pfw7eJ/iyj7igWvplj7ato8Q
         nZ4NVuylJaREWQNZBXogRb+mjcqD5tZH5+whMbgPZFCqdkjonCwc1cSCBXMR8otMBeFf
         sGN0xn9nFrhLHJo/PuCdWqnyEYfKH30URkbP9wvkImUzM+PzTTbZGqWgZ2nfM0RBZUGQ
         wdXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774651712; x=1775256512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        b=e6CxWZunAMu4cjBsPAxiiGxsTFNQ/T/GSaR90nJhdbmnImlnw1xg/OPWjWyuQP6lSA
         ttmn5XVJFqiIBMzyGZcPvUO2nEwuoFkPsvgOSuvVMXaxYY2lkzg3DBYt4b2phO5W7EOB
         wI4iKbGVzxXJzXc6XzBVgCjSBWBzJoXTyRnZs9qy3usvfbCD2ckSIZZD/9xUQtb3NPHr
         meGHsbth2v1+QhLgKsxwqPUetSqBLTNFbbMKOMRkUR67wA1iLW16MXYgUaHSpjiyRwUx
         lb/4j2ZjIb5kC8t8TLhKDl0cS5uB7Ll5eVmZ2uMZRBdNiLs0dpfpaPbhDXyb+kNiKS/J
         kD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774651712; x=1775256512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5gVcMuDsUAZsGbjud51wuG/3Pd9PqWHlN4ImA480V4=;
        b=nZSwPy+cBI5u95WsHyZ/Sy55pr20jZZb3nnIxaO3op/Wuw+mdGPwhKl0i390REfy4J
         i4ZuOYNxsWgwkw+39Vf2fcdXROpfbe7DxNXHMu3ifo1oP6v//CUwamsMy8RTJscQmftO
         3Sx/YXNCstjdEIL52feAZ9ZviZimf+tracmZimY0Yg78nO5fi2FcLFwibMsEGIvLU4EX
         Ym3YszCOqpbKPTJJ9JTLB4YDUZkzHFA0xsv4evspbcJnAJqUCe4JR981l1Rqze7TrETI
         GmOxn4p6utyUoTHTfx7RPaVBWUHocJa/q+hjn4QK01ikPFJLteEfT29wYH+D1z79YzTQ
         hGUA==
X-Forwarded-Encrypted: i=1; AJvYcCVbX0O278x0d4xH9eA9kYiRedKulz+eRfkCggDomVCxTuvlzYe6ZMuc3nAmr6+NpaBqIZW9HoeEMJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkUaud7euBbG5QOBvSc+G8ex16Jin0AiitWqU8UeKuNbcyAfp
	nC54oXh/N0wQuTL4Bn8lLC8G8ywHDyg79srkVO1DWtU3wN3r1KggjA6MABHTJ2112uMwHiYZ2Kb
	p8PSN8nS51jDjAWvBm5leFi7+y9skF9pH3DfF4CeWdQi8HOGU9iXGfk/hVpweKgrR75DalAseQu
	W/OHrGTvOdTnA+ZCCTOYmJ8oDOrkdevW107+en0w==
X-Gm-Gg: ATEYQzzEfV1dItwtT1wPZeWfah6L0DoWGZHJ0ZYU3UxitKOdYYcAfZwNdR6U7OQ2ZaF
	RWIv3q/ZpiblKOLLutFQOETXNWpgi+poSaksGsgU1ASjIWOnc+kELJdzQM14bcQVx6RznZTjxRH
	pxtKUzHWiT2Vv5VVick17WE0fxcS3MOkdr+15Drrb52vke+M7/66vEio05moMsWycMGiorPNxJG
	fCySxDdPdsKyZqf96uc4o0bIgGwM9t92VfK7DgeOqMB5q0Gs4g0bNLrA7QdPsgBvhfT
X-Received: by 2002:ad4:4ee9:0:b0:89a:126a:5b7d with SMTP id 6a1803df08f44-89ce8d5833fmr56319596d6.2.1774651712345;
        Fri, 27 Mar 2026 15:48:32 -0700 (PDT)
X-Received: by 2002:ad4:4ee9:0:b0:89a:126a:5b7d with SMTP id
 6a1803df08f44-89ce8d5833fmr56319316d6.2.1774651711923; Fri, 27 Mar 2026
 15:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-4-5b93415be6dd@linaro.org>
 <CAFEp6-2s=N9=Z5A3gZZYo+XErBT=gMRHdxB7EQV71wPd3UqYrg@mail.gmail.com>
 <b7hndy63j2foc5iuly4reaunaorvg5asfgeza5ptjytaghc772@6jxgnimkcvx6> <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
In-Reply-To: <7757b121-da4f-4157-93c9-4ba162b2696f@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 23:48:21 +0100
X-Gm-Features: AQROBzAMm1yN1rLAJcaNHZgHlMfTEGzX94B2QA3fXAqRa4WXjkjCipnSkkRQp1k
Message-ID: <CAFEp6-0og=MJm-kZmTdTka7per6eHvfO8pR1k87NwGT0no-Ncg@mail.gmail.com>
Subject: Re: [PATCH v11 4/7] media: qcom: camss: Add support to populate sub-devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: k_uuPLhlGyYHMk31cYuBClYpkDYd4DIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE2MCBTYWx0ZWRfX2HZ4IP3SBj6g
 PVNB2hpiJMlk++h/ctgcX2ZDKvPxlteBJesj3CXosxt2zU0PMVhsN72MdQRY40nPuSBEZlx6D4J
 d0iYWbGJJ6jssjjz3adi4jAu61zMsIe6iFktoeQYdKNUVV/Hxied8LjS7y00HQiMQ4DGQKPZvDn
 YDLRHqC29aD/uhKKfCudWIO09V3kyMWEba8Mmgqqby56DbFxNP7M+Bw3a8cl2RQcuwr8tswWouo
 8mk8kzVMYG6A2bIGQUrxhzuZ+15zTMIBVtVfqSLJpGVGpbtwnTeUYJaHYBv564dO/x2o0yow0jT
 gKx4rxNBLNoPMAQOtuF4Os/U3k5QAtKQ/2KbFbVhFi7Zwy4nb9g6wO6AKQxgkAi2KCLNucqwHT+
 gMeV615f0hlxieCKJC9tkCd9WU5m7yBYtSlkLdcCIoq+xteaelYl7F3acePCZzp4WqYTqLWOodz
 +LBIhEufrH3cKU0tdpw==
X-Proofpoint-GUID: k_uuPLhlGyYHMk31cYuBClYpkDYd4DIr
X-Authority-Analysis: v=2.4 cv=F9dat6hN c=1 sm=1 tr=0 ts=69c70941 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XwtK2cgshX5IxEekORwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270160

On Fri, Mar 27, 2026 at 11:37=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 27/03/2026 21:33, Dmitry Baryshkov wrote:
> >> Other drivers typically call the populate function at the end of the
> >> probe function. In this case, however, it is invoked before the main
> >> resources are enabled. I assume this is because the CSIPHY device
> >> needs to be available early. Aside from that, it looks good to me.
> > This becomes fragile. The CSI PHY might be built as a module, which
> > might be loaded later.
>
> Is it any more or less fragile than "simple-mfd" in a DT though ?
> Krzysztof isn't very much in favour of simple-mfd so this method of
> population is the alternative to hand.
>
> The CSIPHY driver uses devm_of_phy_get which handles deferred probe. If
> the PHY module isn't loaded yet when CAMSS tries to get it, CAMSS gets
> -EPROBE_DEFER and retries.

What about relying on v4l2_async_nf_register() in the same way as for
the sensors? That would allow both the sensors and the CSIPHY to be
bound asynchronously when they are ready, assuming the CSIPHY driver
registers a V4L2 subdevice...

>
> >
> >> Reviewed-by: Loic Poulain<loic.poulain@oss.qualcomm.com>
> >>
> >>> @@ -4964,6 +4965,8 @@ static int camss_probe(struct platform_device *=
pdev)
> >>>          if (!camss)
> >>>                  return -ENOMEM;
> >>>
> >>> +       devm_of_platform_populate(dev);
> >>> +
> >>>          camss->res =3D of_device_get_match_data(dev);
> >>>
> >>>          atomic_set(&camss->ref_count, 0);
> > And this looks suspicious. What if drivers for submodules are already
> > there and start probing once populated? Do they have a chance to access
> > this ref_count?
>
> Nope, we don't share the camss pointer or any of the data-structures in
> the existing upstream driver with sub-modules.
>
> ---
> bod
