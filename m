Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E29436BC0
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276966; cv=pass; b=GBkVjYPIJ0f2Y9CBa/0V15DdWHkLYaxy+3VWdFlNDA3+Mhjbq2/I3mVjncgeF5hrlKDeAT8YhAu+jq1KMy7O1Rp/kW2flrW2wGcBEdDcntJLvdSdvlSzN0b5bYtA5vbcwhezUed6iD3Y13bTR/UUUV7pEXbLCttVtaCu2KIPnIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276966; c=relaxed/simple;
	bh=c2tUgg4wBDmD4/wcjlpaTarOSXX4ze+3IyNN+IvUeMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QT75V0yqB2I9o9tDWWWBxhObUadhkC/OcbuGpXYjFxL1rxrIdyvL1dAfTY3WYq7BCqH4t61bZflfzVq1EOaTujdkemzODRe+wQrGp4eTRl6AEsVUqS36sFfZevL87ok9Z+XeHZbvjwK0ZtE4A7WnMEiy8fsyqARaI34siFq6fsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1Z/ZsVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zy0Gpp+r; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1Z/ZsVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zy0Gpp+r"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9SRR1638696
	for <linux-clk@vger.kernel.org>; Tue, 1 Sep 2026 15:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=; b=o1Z/ZsVc8EwHXYoL
	N/X3jHclM9iGocpfX0fLEQm7rWjghERgVeEDRL2JdObPCQonTMvGo2VJNqRfmXz1
	zVmx0uD54G8lm6Kpbmlp26Ddp8whLa2aOM4/zdOUtSTw5GgDhdIMkXXCGajKUYe3
	YLp1WWYJOjx2XHEireOVzIBvS89PF/VIVXg3i7Ek3edaqx/BrGTxSnfuAABglWbn
	T9HxxiOv661pkDs9rfa55PMvrk4kljk258zvuHsylr8MDLwCw1JR+XT+L7oNQG7O
	JLNCR/EanM3qciuNT928O1/MN1b9RQZKyOegz59DaqtBhZhVUtVMdUCC7nEO836d
	x/2NmA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjphr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 15:36:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1c057f480so8106a12.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276963; cv=none;
        d=google.com; s=arc-20260327;
        b=Puf3IAebxohyqTEy5i6mjrKc+sE+QlYvGk8g8TcL9xla0EoVX59HDzRA+4BuaZqVnu
         v7Ke/fA1CKsDnZ91jNcXM0Yb4DKn4xauFkddsEQvm45qCgTGqqnsKeiitBhEEu+36Bhu
         7dRD4FSlmiYP4QPUy1cfO7dGi17LqzAQgzvTNgHUse1dhzdY8v1NHlWXXdrvxDd0Ej+C
         C3Oyo9CnGQNy79n8Mb90HWXPvc09Rhd2G+TGjA7oSEQli7IIKSYzEv7TYLktD8AP30lG
         VWNjBTV5slTwvcyLRtmOjhxJiiJE+XAxry466dfFY39Us6UqeGj7C9A5WSDoUBGoe6dd
         2AcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        fh=v+35kbAJZnriQQSy2O+OsiYS0aqIvRJJp7xkNPByZyo=;
        b=Kk01BwZn9903RY7zMg3qf/sbMtLvoJpHGqauM1nPsrZFquVPnic3e1vOIlOgFr7wZZ
         c4B9v31oocEsG4p5s7va1JaYDe2eR/QUDdOKD6zFwVsfgjJhhmQgvtuZOpRO1DHJ9GRG
         VrOP0Ec0XwYR8JZXzqEnmbbgfxbFtI1gN6UVX59RP82yXQp1hJnoo3FkuOCt90THjVLn
         mR5w1KKlE6U0tNZ9mEh8lLRbTg89R/7PZPKh8czCIBmQ2A+zBDjw1D689m+yf9W1DjZp
         6gbXWIFd3KsuzsthmGI0hBDxbYRvq0aKc3gmReknjCkoRINWo5GEKxuDLI8XsU4PHAsf
         dIhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276963; x=1788881763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=Zy0Gpp+r4x7Ao+n22LT2+fxV2ToWveFfT//WUr6up15GO7qyDc1a/sRXMhSpZBnHrq
         sBEVhSHYPs7Pn/SQG1XCwMugL7cKD6m0BufJj/r0BlmgqLrOLuQsCI1EkUp6xx8jr+y8
         2Dj/yCA+52M/G4fr97LA8h9enyNPtKhGXQTHki6SosD5tOQytoIOTu5P0eoapavBJyjd
         2HH/aIWOiO9CrTw6+AGMWG70z1WodxtC0/bX6k1TpcH+GTg93HJrM1EheGUEROr76BAO
         ttcHwqxFVs9dkEq6ZKU54DgkWU4LTKE4Nbh53OHvrYGYiMMW7fp2kUXUxfh4ywojbqO2
         6Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276963; x=1788881763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=lCcJ5qQpJndrEHpt0dyqMtK5DlfBVNHtavB25BsKEm8QL9uckwU7EdQb6jdodRI3SF
         RW3qPxIOPyNgHfAqy2gfQwQkBoKs8iQ5MVhnQopEOX+RXQpdpo8HqOdAS7Iykiu9ZDxv
         IBiXzyRtNiA4gbB9hbWpp6qEjTiB04Y6gzXeGynHI3oS60vDe2LLcPGn4z7aKwLKWa4m
         AhBmMJ2zA0c6Aa2Xa1miczEp7NtPQGkpLlrhNlPpUXQzGcQxE9sw7eMbAwMR/QZB+qqi
         GpxE2QO0fy15WKc8uuE4NT+sqVNZiZ3pWEmaiJkSauvyfg9IueHzyo/VYf3K+KlHSqjY
         pBYQ==
X-Forwarded-Encrypted: i=1; AKwUvByPNoB0IOJtrZr8Pfp6wwk1XsA8xvwohXkuF/jdAtetgLdscrmCoMlBLYmAqlx2gid+RBiN6FdlQx8=@vger.kernel.org
X-Gm-Message-State: AFuF++l0XXV9cRf02wJ/JhAReeqjiE7OyVSphpSmNwoVqlVnNGoQjZnW
	f7z1M1UWkQhBfFLruQL6Lolo7tO4wKVF8YdBJWxlRpmvUy+CPxtpJpvhZedCF5J5o6XoZ8Y4aS8
	HQoV+mYpyQuyYFVHBSOVoPj84WB7b4aJoNUnX/vGmHAyC9dYEGZr4Pc5fRhAqpzEDg4ddc6HDrH
	0cRZbOh5AipjPgjxEnRqROrGm4a/HO+OKHxlZwBg==
X-Gm-Gg: AYBFou24tXuTrlasB9kU9MgGcmFCVwG2C8BfTjlItgEazSHfNOjX45VPRC5G5lDpgOH
	V3jrzJPguFP15mzLKjvd8g2ew3B3b6lD45V4g5QFvN8v6+3v8AKZGcp66TgzOFpKUjmBukANR3m
	5nvsI1CA8sIpRg2EfOONhW3ohjYg+Ceb1TRni7uyoZoukOjk6Sw6FBCm0/Bw==
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr53079265a91.8.1788276963085;
        Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id
 98e67ed59e1d1-396d0e7255bmr53079149a91.8.1788276962567; Tue, 01 Sep 2026
 08:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com> <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
In-Reply-To: <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:35:50 +0200
X-Gm-Features: AcwNN1XR_ENRcLXIDuE31pwfkZ-t4Y_ZQM0rZSm5dxDSS2r51n9kmCfdHTv7uZI
Message-ID: <CAPx+jO9ijNO7R=oOXs+yd-LaNaVAPwF1Rhh-xVGr-s1K1Fuw6w@mail.gmail.com>
Subject: Re: (subset) [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfXw0JjmvojnK1y
 JdMKPo8l8gDohlfWRSCrwNxUHAI8hNO/GNmdIpEP0Xh85gyQYSvVIitFKB5lqRBQZBli/da/anM
 mRPiTdjPrXnFxlF2fBF5ZzcYZO499Vc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfX4TrwwnTvF8o0
 /bWXuQB/PjaNFJclOcgU67xAsR56w3LdMIsQClwWgkV3RqM8kKtCXV9GLwkLUJ1d9qnE046YWzg
 cA+eZSOYLWMQRMy7qDFYXK/9cyZQpHrzadpw9DCA8XeZ0Y/VMBFEgsFVbO7bNRSfQKCcrqPl7Bz
 gL5xK0vagdLiNIIPiShFrbZ5EGKP6YorEilQoFzA3wFCGmlgnu4//ev3dUWVAD2C/B9k1lOvc7B
 xth2Hz6nEqCCNFSccLe6wtWJ2ELC4cokFNTw41cyoGgeGoVKzPFVqfl4+K4BZeigsVvXdPbhKb6
 aYei7GyvkEFAPtnvdEmjg6cUb/I7rc2DazubPJo6vQus1eUqEdeGl9Gsseop0BTnBRO0KG78nGG
 m+FjwJeTL0QtP0x+XOTt/OM8uLDJ5Tl81QWfbA1actLCbRWLyCn/FUh5zcntV7GmyHjc0mJfqCt
 Sz4kVbWNilyII8RPl+g==
X-Proofpoint-GUID: Qdkwtneg2SiGHRpMwq2_wXXQm5G-UzG6
X-Proofpoint-ORIG-GUID: Qdkwtneg2SiGHRpMwq2_wXXQm5G-UzG6
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96f0e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=elWi3GNyyhLokhY1Yp8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010137

On Tue, Sep 1, 2026 at 4:09=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
>
> On Thu, 27 Aug 2026 23:21:03 +0530, Hardeep Sharma wrote:
> > This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> > IDP reference board.
> >
> > Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings =
up
> > the essential SoC infrastructure required to boot to a serial console:
> >
> >   - Global Clock Controller (GCC) and RPMh clock controller
> >   - RPMh power domains
> >   - Interconnect (NoC) provider
> >   - TLMM pin controller
> >   - PDC interrupt controller and SCM firmware interface
> >   - Devicetree for the SoC and the Kuno IDP board
> >
> > [...]
>
> Applied, thanks!
>
> [04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
>         commit: e304e8919043712191462224ce9d40bb5f5a6bc1
> [05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
>         commit: 12918d595ac96b819b9c3ba0df4c6a4bf50c43a9
> [11/15] clk: qcom: Add Global Clock Controller driver for Kuno
>         commit: 7db06b5f624b583fa2206f98de8437819acada9b
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

Bjorn, looks like patch1 is ready for you to pick as well.

Kind regards
Uffe
