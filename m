Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E78D217F27
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781706260; cv=pass; b=OfSZd2DGK6l/zC2VH91JvJzziKDqyo268MU8aebrSowGQFoKCgNgUt8D/iQ4CZOKro29yVTIW0OcQ25/xzWt+eIF1unBdPYgvE2oKl8t+LlJpy4+pkAt+cj7rAalNOlfEbBAhO42CrIOMHqPzFs1yl6yvSUcAUL/7PGvxLcTuVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781706260; c=relaxed/simple;
	bh=YUj1YaJZgp/6/Dz4ISRzrv6wVKDtSArxrSqys3oGzCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDK49eYCxHYSBmWQLC/awyRWBZdu7uHjbVrpDoJgtfGL9pzfFvZ+v+GmLK64sxdS0JyrgxT36gL8JhH3TQYthiX/f6XzXz5Ub6qrPe1uBPO2oFaAX6+oyI6Z/9cEpOf3EnySzaJG2Ut5cYv48kPAv/GBBntsuiwsPPKr79IOFTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJsiOQop; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZz3fFzj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJsiOQop";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KZz3fFzj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HEHDZB3053303
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 14:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KjYDHCp3Vsj/6JJkuAE0xlj7nYOuShtNQYn7THBEFU=; b=mJsiOQoplOPPiB74
	6SN7qOqFmkQQYJp6ZoMmx5CMWB4jLZxqaKVQtH0XQQS9BrzvOEI3REPHanhN8K77
	mKNckz0EnICqHU+I8J2X3JpbS5q6uC+frxS4aYfj6NV6oHWao3zieFaadTAOg3fK
	FespPZUPna/ZHODSn7xmROhhzCX4dfTh6t8mzmgGiBcA65NKjYi3a5EgPF1KAfVf
	PWSu6FtRBscPHUNJCMH3E/7iveZvrAeY6KzrYktblpVqvVshBZeFsy0lYR7A+Dj/
	SBr/D1Z+6zMyjbBe4YuRb+QC7iuyhWTxaxfYh+Nn/vwf43ev8dBExc5b5FuyWmfC
	JE033g==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euef2bmwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 14:24:18 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-660555be5a0so5768130d50.1
        for <linux-clk@vger.kernel.org>; Wed, 17 Jun 2026 07:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781706258; cv=none;
        d=google.com; s=arc-20240605;
        b=aAITVl67Iwp2+q52qwfNi4SsID1ZR2davOlJ0HPaJUVIzDWrP1eiJHQ1RjU0vUjb80
         xUG8z/l059zbHZ6tkugHsq0UeROt4Fe6muXA+5twLp8V4TlA8FxHs+TZ+vzfKGr5Bj43
         D9BKG1UEkew3J2ZxXAZ5shxQg6UqYudAAoDBsTFxZkWy80C0TiyzUYXFD7PAqnUTi53z
         3lCo50ii7CXoWrqktVgvIH0YeFDapy6Z615svvVuD5d2uLtZkEYjoQ/+mPe9zdEn8pro
         l4+8AbyYljGUztq5cR3PR3jvWzXY17c9LKPj9xFAaHzz/Mj4Vgtl9Xf2g9Ay0l2cbO3X
         FzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3KjYDHCp3Vsj/6JJkuAE0xlj7nYOuShtNQYn7THBEFU=;
        fh=agPLuZK7Gnh1O6JrOOCwD0LBcqySfNPz86ztdSTtDsQ=;
        b=bjS/Ag0VtTLSMuYwiQUj01zXibZAkHAoW04xrtRVQykAJcdyKEhY6nbe9Fhtp+ET15
         mRWccHXBRk7zJq4+7itB2HlBWCdg0qN3JIA58HX4T8n3KhOTwSopU8iNr/4nSKFRTnPl
         Che6QFTehaZV0erEoRMjPnhV8qmtnS8M5rCPJvep/yOyTN3i39LXCyOPscmaiu4DpDsb
         8nPdGBQ+UZ5UNvfRLL9QTQGN/sDd9mHN3J7wRSKqvXR1fTgqJz2r9+ZOtwC3z7UzujPG
         u3xDPhmvPWuWiTuA1yTPpMlkEmHpakJt0kVnS4Hn/EyMXLVJTSy3XzTQfXUCxZCbWRxF
         l8SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781706258; x=1782311058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KjYDHCp3Vsj/6JJkuAE0xlj7nYOuShtNQYn7THBEFU=;
        b=KZz3fFzjCUsFmQMJsfks7WXthnQJGFTR1+GF8z8CknITp5mdNTVgYIMNyc2EqagIM+
         +edZH17Hp1mAM3iXxF9EVhvU7Iqrue96h2GjZdbKYgB99oHdIZRnIq7rrrVBblxNxXZD
         oOL12hTZGIGKCWZ4mLizY/pKOOwj+89rgx8s2VHUIwaOjLZHXNg1dDI7KKl+52cVJK89
         EdVC/TIwQNSZ11O7HqX+V96+5dOq8y4szz59NAheBiO5O1jBk3Ho0pfhg3GWc4Dw2tJn
         b+XiO3tQiuazNcJ5SThlqtC+hskicie7PjEla/d3aBzsr5B+5iV+VohD5a2XJ/zO0oTi
         EmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706258; x=1782311058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3KjYDHCp3Vsj/6JJkuAE0xlj7nYOuShtNQYn7THBEFU=;
        b=dnfRHgOGsKCa3qXG4YqejMCjE4qagpA1CqrQ4pnk0cduYp8ytedklDJeqJIloR9UGz
         frRJpaNz9pm3Kr5MQYKjgY2BLLjws2GZyQsT1MdosAjjhgOi30zziBxtpD9NzwUVZYVz
         5jWMJtLNa3zMDD4T5XQ3Gm8SEQxBibyR5txsM7mg6qSrbq9W808SdXw5noxtPRWqA8NV
         bM1AHz95B8NSry7JkcH2ZWDbkzn5GdjQ20q11p1LKGv063qB3lA04op/3pBOOfE1pGt6
         9ls1NhOOwGxI7KFhwsqi5p3OFnyrrLCP7/bKoAa3NncqFUTBr5yZgZBsYxQw9mjkmZOx
         94vw==
X-Forwarded-Encrypted: i=1; AFNElJ8OYf0uBP3TwiYyCMPQX27ltuMNzmbf9Kp79oH1iG5teHdAgDWTotQDvtBBzw2yzddOUCe9O8MeZoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/RJUjyY4ZjBqaSBycr+JbZbKFdOhQhE2NrRXAJkEsTP5QdA7V
	sTkd7urYrPA4kaB9H2KjTpApz1JJxojmcr+F/6ftEiyPEgXzjwQK4GVh3PbbqOH9zTGOvjQNM/Z
	1IzEaJHEvBTDSbbi2M5xV0asVwyg99Hik4AMGojW9rQequ1bIw5HECcADVkCBNkiu7U+SBPDbZ7
	0XRYyN2xcKNiyrfk3pc2l9tVtWc31A7SGkzElo9g==
X-Gm-Gg: AfdE7cnNjydlTjW0iUIKwvRq27pu2Trspy5Bqb7LmCA9PTHlu3I5H9o4gEGLv4jPTMx
	dWsI+yYYq2cG8H0BmmkmiitySojejvkw7iyf9u1l9uU5FEYf/Js4AEUWoMDauyf0UtNZlUia1vP
	Im6XodHRvIr8aPbTSgPr4VkzkhtkD83UrXwRsePD6v05Vm/Frh7T3Ej1o0lNMa902zp4ut
X-Received: by 2002:a53:ac9c:0:b0:662:d600:8f76 with SMTP id 956f58d0204a3-662d600ad2dmr2113312d50.59.1781706257832;
        Wed, 17 Jun 2026 07:24:17 -0700 (PDT)
X-Received: by 2002:a53:ac9c:0:b0:662:d600:8f76 with SMTP id
 956f58d0204a3-662d600ad2dmr2113250d50.59.1781706257291; Wed, 17 Jun 2026
 07:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com> <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
In-Reply-To: <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 16:24:05 +0200
X-Gm-Features: AVVi8CccDL5SethQdiNRDSIMK-0gtwSaPj8YM-cGC3QIWq1yA4AndeXInLTeUd4
Message-ID: <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=F8hnsKhN c=1 sm=1 tr=0 ts=6a32ae12 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=vnREMb7VAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=gxl3bz0cAAAA:8 a=2mLgCmtiJwWTe1bua7oA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22 a=cvBusfyB2V15izCimMoJ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEzOCBTYWx0ZWRfXxF4LxuzqHfRJ
 dCZTc3Gzp/6x7krmAIPcpqOXWM7PVqySRXX8/xXebkUSI7AkOWEOCG0XlBUzejCg1X8oEUPIyaz
 oeXDCDO5T5ALu1VZVnOhbtTqMzrfHus=
X-Proofpoint-GUID: bmF9g7uSP9aeFrm8P9xw_YRfKZeBhN20
X-Proofpoint-ORIG-GUID: bmF9g7uSP9aeFrm8P9xw_YRfKZeBhN20
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEzOCBTYWx0ZWRfXwfBjucymnZax
 u1jRrLNhQzOX0FohEzSWYDjHrlyDZbXBTU49iUuf5gRpxrCtqYOlYNvmJDoRpGO2YvjqJUDF2zz
 kQmmeYhTWi6YRtjmjKyYdvXXxCmOX4Ys3LlJXn+8E4EBgkPN/FGD3a3gVRCModYGDPETs1E26pt
 LFQL9wyqIJZ1bJOS6bofJsBpJqkH+3FkW/FnXcc56JQKGmC1bt0YqaSOwACZpCsUfpBKQaASsyW
 5s32hE1dRq/p8+NT4Dre7r5VckjHbrgYe2eh0Y6ONmuaPsVzKpUtmNSwPyx7uQAJKhKNZlWiB7i
 fVpDhTbkJ75Ub0+80c8h1atPL+ywf5b2XcUXn9iFkKJlvJW1wVmzc2Bv212rbGD8lPNLiwLuIrY
 lv23CMZ2dcVL9mb3YE1TQfCmN+BP87GyQX3yZ7X7Io5xRG25v2ijIzbyuDs0iZoXlKuRm92io9c
 M/teigkXfUtrxclN5mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170138

On Tue, Jun 16, 2026 at 11:09=E2=80=AFPM Brian Masney <bmasney@redhat.com> =
wrote:
>
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
>
> Let's go ahead and add a framework-level sync_state callback for the clk
> subsystem. If a driver doesn't have a sync_state callback configured,
> which is the 99+% use case today, then let's set it up to use the
> clk_sync_state() introduced in this commit so that no driver changes
> are needed.
>
> At the time of this writing, there are currently only 7 clk drivers that
> implement sync_state, and all are Qualcomm SoCs where they interact with
> the interconnect framework via icc_sync_state(). A shared helper has
> been created for this platform that calls clk_sync_state(). It is
> expected that any new clk drivers that want to implement their own
> sync_state will also need to call clk_sync_state() at the end of their
> custom sync_state callback.
>
> There will be several stages of disabling unused clks:
>
> - The first phase will be executed at late_initcall and it will only
>   disable unused clks that do not have a struct dev.
> - The sync_state callback will be invoked for each clk driver once all
>   consumers have probed.
>
> This is based on previous attempts by Saravana Kannan and Abel Vesa
> that are linked below.
>
> This change was tested on a Thinkpad x13s laptop.
>
>     [    0.308051] clk: Disabling unused clocks not associated with a dev=
ice
>     [    6.541069] qcom_aoss_qmp c300000.power-management: clk: Disabling=
 unused clocks
>     [    6.843310] qcom-qmp-pcie-phy 1c24000.phy: clk: Disabling unused c=
locks
>     [    7.604556] qcom-qmp-pcie-phy 1c14000.phy: clk: Disabling unused c=
locks
>     [    8.446161] qcom-qmp-usb-phy 88f1000.phy: clk: Disabling unused cl=
ocks
>     [    8.446293] qcom-qmp-usb-phy 88ef000.phy: clk: Disabling unused cl=
ocks
>     [    8.546067] qcom-qmp-combo-phy 88eb000.phy: clk: Disabling unused =
clocks
>     [    8.546203] qcom-qmp-combo-phy 8903000.phy: clk: Disabling unused =
clocks
>     [    8.546254] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
>     [   15.436834] qcom-cpufreq-hw 18591000.cpufreq: clk: Disabling unuse=
d clocks
>     [   15.436953] clk-rpmh 18200000.rsc:clock-controller: clk: Disabling=
 unused clocks
>     [   15.723348] qcom-qmp-pcie-phy 1c06000.phy: clk: Disabling unused c=
locks
>     [   21.063241] q6prm-lpass-clock 3000000.remoteproc:glink-edge:gpr:se=
rvice@2:clock-controller: clk: Disabling unused clocks
>     [   21.081996] va_macro 3370000.codec: clk: Disabling unused clocks
>     [   21.092740] rx_macro 3200000.rxmacro: clk: Disabling unused clocks
>     [   21.118261] wsa_macro 3240000.codec: clk: Disabling unused clocks
>     [   21.128758] tx_macro 3220000.txmacro: clk: Disabling unused clocks
>
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Link: https://www.youtube.com/watch?v=3DtXYzM8yLIQA
> Link: https://lore.kernel.org/all/20210407034456.516204-1-saravanak@googl=
e.com/
> Link: https://lore.kernel.org/all/20221227204528.1899863-1-abel.vesa@lina=
ro.org/

For future revisions, please add ulfh@kernel.org on to/cc.

> ---
>  drivers/clk/clk.c | 72 +++++++++++++++++++++++++++++++++++++++++++++----=
------
>  1 file changed, 59 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9cb2b42d1be4..7a15cceec620 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c

[...]

>  void clk_sync_state(struct device *dev)
>  {
> -       /* Will fill in */
> +       __clk_disable_unused(dev);
>  }
>  EXPORT_SYMBOL_GPL(clk_sync_state);
>
> @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_n=
ode *np, struct clk_hw *hw)
>         core->dev =3D dev;
>         clk_pm_runtime_init(core);
>         core->of_node =3D np;
> -       if (dev && dev->driver)
> +       if (dev && dev->driver) {
>                 core->owner =3D dev->driver->owner;
> +
> +               /*
> +                * If a clk provider sets their own sync_state, then it n=
eeds to
> +                * also call clk_sync_state(). dev_set_drv_sync_state() w=
on't
> +                * overwrite the sync_state callback, and this call will =
fail
> +                * with -EBUSY.
> +                */
> +               dev_set_drv_sync_state(dev, clk_sync_state);

We have cases where a device node represents a provider for multiple
types of resources, like clocks, power-domains (genpds), resets, etc,
as in the qcom case, for example.

For power-domain provider drivers (genpd) we also try to assign the
->sync_state() callback, see of_genpd_add_provider_simple() and
of_genpd_add_provider_simple(). This means the above doesn't play well
with how genpd behaves, so we need to figure out a way to manage these
cases.

In this regard, we also have of_genpd_sync_state(), which allows a
genpd provider driver to explicitly call genpd's sync state function,
if/when needed.

Unfortunately I am not able to suggest a detailed solution for how to
move this forward at this point, as it requires some more thinking and
I am heading for some vacation very soon.

> +       }
>         core->hw =3D hw;
>         core->flags =3D init->flags;
>         core->num_parents =3D init->num_parents;
>
> --
> 2.54.0

Kind regards
Uffe
