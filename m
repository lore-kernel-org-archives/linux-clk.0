Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC76390CA3
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742946; cv=pass; b=XulnOQXsmf502uy4os+qC05XD+MXGf5R2sA48d7CmegaWlbc9o9qMXFRXyIvo0UYdylS48K7/tWm4q3gcMeju+0FV0c8/7O6hFUio8lAYj7FUfedUbxZrbXprdQ5JE9XAJzzwTVfayQOsyMgrZasVfUQ2rjGq/TY9yqUlJMzU58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742946; c=relaxed/simple;
	bh=x/yebZqqN+tRIG8jG2KHZidMMSZsb9AxMrLIFF+xxGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNAxVf/Ozq9jFSYxyd6nGKhe/arWiUqg/RT7rC8cJ1LfI1/uQMJHNr5kg3y0eEJKIxxip66WxWWHI6I1aAcWPu+Pf6cVMnrqh+NXPLMJtefOKjpEBHPhAZHN1lSdmzP0+8mkgXTGrZ+sX4KKBy+VEjTtWmt/zdwW6VQz6tL58II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLOgrs4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkHmycO8; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLOgrs4D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkHmycO8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOW6K1900384
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 14:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEGKJWdKLpnMw2Gs047wbG5R/aVqF4YyIyQhsfAjLnQ=; b=LLOgrs4DT+9Vc1vi
	MNlXr7JfWI8SmDFzOFkc5B8ntgMZ8DjC3vAsuIPm6e04Ou1sRs9/NNeAUNSLl2WN
	W4GRJPksrRCy2nTxQZoJgUdpWIxYYTaB6U8xajpW6XcJzIsAr8BVd9ZeH348pIy9
	w9geNSeXForzpPy40YganKlpS+XbFiQ6q0Kj8/eOnzGSTAoajBr7Eo8U0bTvcOoR
	pmE36av5U5X/U529RT6rnCacu6QomBFO1bAjZGUo8JHQCI5ACkcgAlHVezGzHCmg
	Lgfm4dMS2lXZM6Gz3xCPC8M20meleyZ82wcMqZg2F6ECF8k2zGz9FnYBSoQgd3ki
	+mUVTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpu5ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 14:49:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939c30aa9a0so81524785a.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 07:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789742941; cv=none;
        d=google.com; s=arc-20260327;
        b=lIo3GEavWlXS+K7gAMj7ts+LQ1rE3QfJ13kFUfNo6ZogIbqnrYzfHRYArZKggeEtDp
         PtG/gmhsW8u3Qx2jFOrINf3o0evOnkeFgA3mlUF5WEkWJgn+sPNQnGLaCHAAU0B0xw1l
         zf2qNp9svgZkcgLirC+lueyc6IqNqIQNBCi7sP0IIk5DF/VVKqxlIDKEITf8DVIhZHAy
         nqgCo6W64yEWcXJi5kAVitEJJLgQHAiaH6yz+2nwlpjEm40blf/XYRJvoFGVGCCPXzJI
         aNZhaV5vrk30hHDk2acuUdEnD9y6fWPmlUJ7hiYRT5fDMqLIdSpZAd7UlUDWNKb4Qo+p
         pthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aEGKJWdKLpnMw2Gs047wbG5R/aVqF4YyIyQhsfAjLnQ=;
        fh=buCNX5iJdR/nQnEqstJQ1x+5VT47K4htACIc4Nlzl7Q=;
        b=hvqEyUVa/Wob5xIQN2qOcLLa1ZOnNiQi8K82kRR5iwQHPI7W0HJ6dEV1CYHm1vYfbP
         gUsEiLLfS56+3dTxRz9zZKP8Q4JT1qhoSRvdkRiEaR17AILoW8ABZXFthE5cek2JtSUY
         7OMxQw7C7Q8aHjKUj93HETMV7yEt1WF1Dwm1n+Ww2ywkGtXZmZSX7xrBGzw1FDAO9z9j
         Lz26z70K57Pd+yt4RFqBfhuQEZIlExICVX9+9r3agXDzGbAiSpksRZtQlgScqwGL2qWd
         SbuzeNQDEYv4Fg7ofn6u6iLm2+BNi2wK2JUhsw2lMHUceDbDWkkRqjBWctrHzXLo2ez4
         PbHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742941; x=1790347741; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aEGKJWdKLpnMw2Gs047wbG5R/aVqF4YyIyQhsfAjLnQ=;
        b=VkHmycO8uv3vmP+eywM401ZA6mTL3xcLZB7XAu8mHc88Kb4NQWfxbWLJ97L5jmldEf
         kEv5fiX53x+kG3t4t+xhIlds3vTvH++2u4QXhlu4huTQ9Wdmq1fK4f2CdiHdXxddGw4k
         2VSTRtA2G76QEB/PzySyMPRjDWNck8xpgZB4do3KvNDBSd1An8deYkgcUKOtdpzQBSYM
         m4G1oSvGPVACTPlkPJm7C2CHkFL2T3Wq//ZPiaSzOnFsB8gR1PIJVTC3PIq912o1fMsk
         aaRieCwihNQpS0hF9VlYo5u8QRj2j0uSesq/mfzqBjDQkklRkJssMMDNFlDOdQg0fFJ/
         aAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742941; x=1790347741;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEGKJWdKLpnMw2Gs047wbG5R/aVqF4YyIyQhsfAjLnQ=;
        b=OveLU4Z5LCeorAYQj2vnIndv1qmtivRDod17M/BsJ8SQ48QCCPKpuhIEBnvkgpxao8
         RPDQqQT84G65PS4so3OjHm4+1RNiKMRez6ZDPin1WWmiXq8eiPht9QNmB968RrDITIx1
         MUMUa47aXpJ2aFg1WzgSDDkrwX6y59A8q5PO9h5ndygSKr6jAKbB3TBtvAGs64AsMPG1
         ONVxf6xmscxe/Gpjg4JWkaxPkZnm81CLzWS2yk1nl2aezRwuVAeHX/zYuLdXIrRcsTP+
         Krz4/+DJtwYeZqb6aBDD3hv9uZIw09/Zk9EdykhAZYxniCFzXy8pfDFjj/o9yUv1Mcvj
         tskg==
X-Forwarded-Encrypted: i=1; AKwUvBzwskVVMwe8F8taQrtwPfwPODdU5GXgDzU+GVozaynymxgBfYKXq2L+unkR15evy+jemUQUX9JQOgA=@vger.kernel.org
X-Gm-Message-State: AFuF++l686UPAzDD2C67yE3D1l3cNhikJiZphbiaG3TV4SfihWme5xA/
	2x+uMkoev4iTiK4ROlbpdVRX7d8rsumV6DJCD6QMC33WY45yHR5vZILyjJAhShnMWHOAtbQgWg9
	qK1es4e3UzW7/9PifqT0NuxxPYMBFhADQ8lPaq8mZuzKQ70ropiFDd3VNgmMjB42FjyP5di5mDD
	lYAsLRjqof/wqXTg1h0oZLM2CUTJTMYS/sQaM2dg==
X-Gm-Gg: AYBFou0b3M3na9ZA3AOUqFck0mLo1zHymXKJMFtIbhX8tDoenNBj3LPgeFPbOnyA6Dd
	3GlvOs5Q9FSUIpTItunoEwG7tjRUHtxE6Khpx0uzFcPhIceAhyE6sIv0UnX/hBN+jzYYQMYrlv8
	A6OUan1XdFNmiVF7/pJo/uxbQLaL2tmqM2009PPcZugATBaVAVe/EmOt2GRqtcTwFs/AZUJCjaJ
	o3T511X4jhSC2wH5cq3uEmBdceaYQ7NG/jye9q8XS13OqTtTsfJCDi4OKIdr4bVvst7BaUGaQ==
X-Received: by 2002:a05:620a:3193:b0:93b:c581:2e16 with SMTP id af79cd13be357-93bdc70a9e2mr380949585a.30.1789742940730;
        Fri, 18 Sep 2026 07:49:00 -0700 (PDT)
X-Received: by 2002:a05:620a:3193:b0:93b:c581:2e16 with SMTP id
 af79cd13be357-93bdc70a9e2mr380942685a.30.1789742940098; Fri, 18 Sep 2026
 07:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-0-dc244e124e71@linaro.org>
 <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:48:47 +0200
X-Gm-Features: AcwNN1VyQc5hTFTyVwqM2V6ETDD0juMD_-9QG-ROfpg2um5lYUHYKTebxcRhbR4
Message-ID: <CAFEp6-37YmRR147eH_wfnD-eQPpg2Fy-jc3QNx5VyiFLkmzG_g@mail.gmail.com>
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API devices
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX87Agv9D9yUvC
 KZOviLiSxXbgZPbviBJ5/B+XTeNIOKb8+aAFElZm++Vr0LVjXBJfMquQmw/MF0LlvaU2KWno3vI
 x4EDJ+w+xX7XdPWZW4rqpDrAnee+UmIsOj0oS6dRmrHFSfcHxMZTo/R91ADfoEygx0i1nvrY60M
 YHT1+z5JaHoA1X8r6CQYYYZEv8nJjICHbqqv7oehmz1viSsBVTtfk//0E0VjZwfqfDUNdJIolCV
 AfszHNSFbg9g6dn+JfbWxDSpKZbTnk1DekSfJi11t9qc3pB4gNJVyYSOGuH0Gvq4+jXptaAYuNY
 iGSCvjfwCfeYO1K0XODSU1GIHWDKQG9jxMtZlW8oa9yYe2T+2uDrDm3Jkw2J3lS4mm2ld7fxgE3
 +ggr3q5QAaoV2J+x27sUEN40qDAz44WlagWSXlV2AHzHqKAPYyYw2wRDa6FaCFFV3K4YgcQ5i7o
 0DRfRTrcu0QlAZBYsxQ==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad4f5e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=fKnwG9EHs3sFRsC3j0wA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIxMCBTYWx0ZWRfX0SuwWxaUeY5H
 DPZvzxMIgthmIEh91eY25PxoVCDu4dls+aix68nW2TQL1II12JxC+05M1N0/O4wfXJ6L0G0cRJh
 gtDKDv7VkGRNNb7FwE2y9n70JcHMZgA=
X-Proofpoint-ORIG-GUID: 0y2E3mHxWhZII4lpWsmBIJoT0mBpGT-0
X-Proofpoint-GUID: 0y2E3mHxWhZII4lpWsmBIJoT0mBpGT-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180210

On Fri, Sep 18, 2026 at 3:56=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add the ability to use a PHY pointer which interacts with the standard PH=
Y
> API.
>
> In the first instance the code will try to use the new PHY interface. If =
no
> PHYs are present in the DT then the legacy method will be attempted.
>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Gl=
ymur)
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/Kconfig        |   1 +
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 200 +++++++++++++++++=
++++--
>  drivers/media/platform/qcom/camss/camss-csiphy.h |  11 +-
>  drivers/media/platform/qcom/camss/camss.c        | 104 ++++++++++--
>  drivers/media/platform/qcom/camss/camss.h        |   1 +
>  5 files changed, 285 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index 4eda48cb1adf0..1edc5e5a1829e 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,4 @@ config VIDEO_QCOM_CAMSS
>         select VIDEO_V4L2_SUBDEV_API
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
> +       select PHY_QCOM_MIPI_CSI2
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index 539ac4888b608..aaed7d0309dd6 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -13,6 +13,8 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <media/media-entity.h>
> @@ -131,10 +133,10 @@ static u8 csiphy_get_bpp(const struct csiphy_format=
_info *formats,
>  }
>
>  /*
> - * csiphy_set_clock_rates - Calculate and set clock rates on CSIPHY modu=
le
> + * csiphy_set_clock_rates_legacy - Calculate and set clock rates on CSIP=
HY module
>   * @csiphy: CSIPHY device
>   */
> -static int csiphy_set_clock_rates(struct csiphy_device *csiphy)
> +static int csiphy_set_clock_rates_legacy(struct csiphy_device *csiphy)
>  {
>         struct device *dev =3D csiphy->camss->dev;
>         s64 link_freq;
> @@ -200,7 +202,7 @@ static int csiphy_set_clock_rates(struct csiphy_devic=
e *csiphy)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_set_power(struct v4l2_subdev *sd, int on)
> +static int csiphy_set_power_legacy(struct v4l2_subdev *sd, int on)
>  {
>         struct csiphy_device *csiphy =3D v4l2_get_subdevdata(sd);
>         struct device *dev =3D csiphy->camss->dev;
> @@ -219,7 +221,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, i=
nt on)
>                         return ret;
>                 }
>
> -               ret =3D csiphy_set_clock_rates(csiphy);
> +               ret =3D csiphy_set_clock_rates_legacy(csiphy);
>                 if (ret < 0) {
>                         regulator_bulk_disable(csiphy->num_supplies,
>                                                csiphy->supplies);
> @@ -254,7 +256,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, i=
nt on)
>  }
>
>  /*
> - * csiphy_stream_on - Enable streaming on CSIPHY module
> + * csiphy_stream_on_legacy - Enable streaming on CSIPHY module
>   * @csiphy: CSIPHY device
>   *
>   * Helper function to enable streaming on CSIPHY module.
> @@ -262,7 +264,7 @@ static int csiphy_set_power(struct v4l2_subdev *sd, i=
nt on)
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -static int csiphy_stream_on(struct csiphy_device *csiphy)
> +static int csiphy_stream_on_legacy(struct csiphy_device *csiphy)
>  {
>         struct csiphy_config *cfg =3D &csiphy->cfg;
>         s64 link_freq;
> @@ -306,11 +308,98 @@ static int csiphy_stream_on(struct csiphy_device *c=
siphy)
>   *
>   * Helper function to disable streaming on CSIPHY module
>   */
> -static void csiphy_stream_off(struct csiphy_device *csiphy)
> +static void csiphy_stream_off_legacy(struct csiphy_device *csiphy)
>  {
>         csiphy->res->hw_ops->lanes_disable(csiphy, &csiphy->cfg);
>  }
>
> +/*
> + * csiphy_stream_on - Enable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to enable streaming on CSIPHY module.
> + * Main configuration of CSIPHY module is also done here.
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_stream_on(struct csiphy_device *csiphy)
> +{
> +       u8 bpp =3D csiphy_get_bpp(csiphy->res->formats->formats, csiphy->=
res->formats->nformats,
> +                               csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
> +       struct csiphy_lanes_cfg *lncfg =3D &csiphy->cfg.csi2->lane_cfg;
> +       struct phy_configure_opts_mipi_dphy *dphy_cfg;
> +       union phy_configure_opts dphy_opts =3D { 0 };
> +       struct device *dev =3D csiphy->camss->dev;
> +       u8 num_lanes =3D lncfg->num_data;
> +       s64 link_freq;
> +       int ret;
> +
> +       dphy_cfg =3D &dphy_opts.mipi_dphy;
> +
> +       link_freq =3D camss_get_link_freq(&csiphy->subdev.entity, bpp, nu=
m_lanes);
> +
> +       if (link_freq <=3D 0) {
> +               dev_err(dev,
> +                       "Cannot get CSI2 transmitter's link frequency\n")=
;
> +               return -EINVAL;
> +       }
> +
> +       ret =3D phy_mipi_dphy_get_default_config_for_hsclk(link_freq, num=
_lanes,
> +                                                        dphy_cfg);
> +       if (ret < 0) {
> +               dev_err(dev, "Invalid config for link frequency %lld\n",
> +                       link_freq);
> +               return ret;
> +       }
> +
> +       ret =3D phy_set_mode(csiphy->phy, PHY_MODE_MIPI_DPHY);
> +       if (ret) {
> +               dev_err(dev, "Failed to set phy mode\n");
> +               return ret;
> +       }
> +
> +       ret =3D phy_configure(csiphy->phy, &dphy_opts);
> +       if (ret) {
> +               dev_err(dev, "failed to configure MIPI D-PHY\n");
> +               goto error;
> +       }
> +
> +       return phy_power_on(csiphy->phy);
> +
> +error:
> +       return ret;
> +}
> +
> +/*
> + * csiphy_stream_off - Disable streaming on CSIPHY module
> + * @csiphy: CSIPHY device
> + *
> + * Helper function to disable streaming on CSIPHY module
> + */
> +static void csiphy_stream_off(struct csiphy_device *csiphy)
> +{
> +       phy_power_off(csiphy->phy);
> +}
> +
> +/*
> + * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> + * @sd: CSIPHY V4L2 subdevice
> + * @enable: Requested streaming state
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int csiphy_set_stream_legacy(struct v4l2_subdev *sd, int enable)
> +{
> +       struct csiphy_device *csiphy =3D v4l2_get_subdevdata(sd);
> +       int ret =3D 0;
> +
> +       if (enable)
> +               ret =3D csiphy_stream_on_legacy(csiphy);
> +       else
> +               csiphy_stream_off_legacy(csiphy);
> +
> +       return ret;
> +}
>
>  /*
>   * csiphy_set_stream - Enable/disable streaming on CSIPHY module
> @@ -572,16 +661,16 @@ csiphy_match_clock_name(const char *clock_name, con=
st char *format, ...)
>  }
>
>  /*
> - * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resou=
rces
> + * msm_csiphy_subdev_init_legacy - Initialize CSIPHY device structure an=
d resources
>   * @csiphy: CSIPHY device
>   * @res: CSIPHY module resources table
>   * @id: CSIPHY module id
>   *
>   * Return 0 on success or a negative error code otherwise
>   */
> -int msm_csiphy_subdev_init(struct camss *camss,
> -                          struct csiphy_device *csiphy,
> -                          const struct camss_subdev_resources *res, u8 i=
d)
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +                                 struct csiphy_device *csiphy,
> +                                 const struct camss_subdev_resources *re=
s, u8 id)
>  {
>         struct device *dev =3D camss->dev;
>         struct platform_device *pdev =3D to_platform_device(dev);
> @@ -709,6 +798,54 @@ int msm_csiphy_subdev_init(struct camss *camss,
>         return ret;
>  }
>
> +/*
> + * msm_csiphy_subdev_init - Initialize CSIPHY device structure and resou=
rces
> + * @camss: CAMSS structure
> + * @port: DT port index
> + *
> + * Return 0 on success or absence of link, negative error code otherwise
> + */
> +int msm_csiphy_subdev_init(struct camss *camss, u8 port)
> +{
> +       const struct camss_subdev_resources *res =3D &camss->res->csiphy_=
res[port];
> +       struct csiphy_device *csiphy =3D &camss->csiphy[port];
> +       struct device *dev =3D camss->dev;
> +       struct device_node *ep, *remote;
> +       int ret;
> +
> +       ep =3D of_graph_get_endpoint_by_regs(dev->of_node, port, -1);
> +       if (!ep)
> +               return 0;
> +
> +       remote =3D of_graph_get_remote_port_parent(ep);
> +       of_node_put(ep);
> +       if (!remote)
> +               return 0;
> +
> +       if (!of_device_is_available(remote)) {
> +               of_node_put(remote);
> +               return 0;
> +       }
> +
> +       csiphy->phy =3D devm_phy_get_by_of_node(dev, remote);
> +       of_node_put(remote);
> +       if (IS_ERR(csiphy->phy)) {
> +               ret =3D PTR_ERR(csiphy->phy);
> +               goto done;
> +       }
> +
> +       csiphy->camss =3D camss;
> +       csiphy->id =3D res->csiphy.id;
> +       csiphy->res =3D &res->csiphy;
> +
> +       snprintf(csiphy->name, ARRAY_SIZE(csiphy->name), "csi%d", csiphy-=
>id);
> +
> +       return 0;
> +
> +done:
> +       return ret;
> +}
> +
>  /*
>   * csiphy_link_setup - Setup CSIPHY connections
>   * @entity: Pointer to media entity structure
> @@ -743,8 +880,12 @@ static int csiphy_link_setup(struct media_entity *en=
tity,
>         return 0;
>  }
>
> -static const struct v4l2_subdev_core_ops csiphy_core_ops =3D {
> -       .s_power =3D csiphy_set_power,
> +static const struct v4l2_subdev_core_ops csiphy_core_ops_legacy =3D {
> +       .s_power =3D csiphy_set_power_legacy,
> +};
> +
> +static const struct v4l2_subdev_video_ops csiphy_video_ops_legacy =3D {
> +       .s_stream =3D csiphy_set_stream_legacy,
>  };
>
>  static const struct v4l2_subdev_video_ops csiphy_video_ops =3D {
> @@ -758,8 +899,13 @@ static const struct v4l2_subdev_pad_ops csiphy_pad_o=
ps =3D {
>         .set_fmt =3D csiphy_set_format,
>  };
>
> +static const struct v4l2_subdev_ops csiphy_v4l2_ops_legacy =3D {
> +       .core =3D &csiphy_core_ops_legacy,
> +       .video =3D &csiphy_video_ops_legacy,
> +       .pad =3D &csiphy_pad_ops,
> +};
> +
>  static const struct v4l2_subdev_ops csiphy_v4l2_ops =3D {
> -       .core =3D &csiphy_core_ops,
>         .video =3D &csiphy_video_ops,
>         .pad =3D &csiphy_pad_ops,
>  };
> @@ -785,10 +931,15 @@ int msm_csiphy_register_entity(struct csiphy_device=
 *csiphy,
>  {
>         struct v4l2_subdev *sd =3D &csiphy->subdev;
>         struct media_pad *pads =3D csiphy->pads;
> -       struct device *dev =3D csiphy->camss->dev;
> +       struct camss *camss =3D csiphy->camss;
> +       struct device *dev =3D camss->dev;
>         int ret;
>
> -       v4l2_subdev_init(sd, &csiphy_v4l2_ops);
> +       if (camss->legacy_phy)
> +               v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
> +       else
> +               v4l2_subdev_init(sd, &csiphy_v4l2_ops);
> +
>         sd->internal_ops =3D &csiphy_v4l2_internal_ops;
>         sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE;
>         snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
> @@ -816,9 +967,22 @@ int msm_csiphy_register_entity(struct csiphy_device =
*csiphy,
>         ret =3D v4l2_device_register_subdev(v4l2_dev, sd);
>         if (ret < 0) {
>                 dev_err(dev, "Failed to register subdev: %d\n", ret);
> -               media_entity_cleanup(&sd->entity);
> +               goto media_entity_err;
> +       }
> +
> +       if (!IS_ERR(csiphy->phy)) {
> +               ret =3D phy_init(csiphy->phy);
> +               if (ret) {
> +                       dev_err(dev, "%s init fail %d\n", csiphy->name, r=
et);
> +                       v4l2_device_unregister_subdev(sd);
> +                       goto media_entity_err;
> +               }
>         }
>
> +       return 0;
> +
> +media_entity_err:
> +       media_entity_cleanup(&sd->entity);
>         return ret;
>  }
>
> @@ -828,6 +992,8 @@ int msm_csiphy_register_entity(struct csiphy_device *=
csiphy,
>   */
>  void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
>  {
> +       if (!IS_ERR(csiphy->phy))
> +               phy_exit(csiphy->phy);
>         v4l2_device_unregister_subdev(&csiphy->subdev);
>         media_entity_cleanup(&csiphy->subdev.entity);
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.h
> index 9d9657b82f748..7a357044b9fdb 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.h
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
> @@ -12,6 +12,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/interrupt.h>
> +#include <linux/phy/phy.h>
>  #include <media/media-entity.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-mediabus.h>
> @@ -97,6 +98,7 @@ struct csiphy_device_regs {
>
>  struct csiphy_device {
>         struct camss *camss;
> +       struct phy *phy;
>         u8 id;
>         struct v4l2_subdev subdev;
>         struct media_pad pads[MSM_CSIPHY_PADS_NUM];
> @@ -104,6 +106,7 @@ struct csiphy_device {
>         void __iomem *base_clk_mux;
>         u32 irq;
>         char irq_name[30];
> +       char name[16];
>         struct camss_clock *clock;
>         bool *rate_set;
>         int nclocks;
> @@ -118,9 +121,11 @@ struct csiphy_device {
>
>  struct camss_subdev_resources;
>
> -int msm_csiphy_subdev_init(struct camss *camss,
> -                          struct csiphy_device *csiphy,
> -                          const struct camss_subdev_resources *res, u8 i=
d);
> +int msm_csiphy_subdev_init_legacy(struct camss *camss,
> +                                 struct csiphy_device *csiphy,
> +                                 const struct camss_subdev_resources *re=
s, u8 id);
> +
> +int msm_csiphy_subdev_init(struct camss *camss, u8 port);
>
>  int msm_csiphy_register_entity(struct csiphy_device *csiphy,
>                                struct v4l2_device *v4l2_dev);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 2123f6388e3d7..84097d82d99c9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4799,8 +4799,43 @@ static int camss_parse_ports(struct camss *camss)
>         fwnode_graph_for_each_endpoint(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
> -               csd =3D v4l2_async_nf_add_fwnode_remote(&camss->notifier,=
 ep,
> -                                                     typeof(*csd));
> +               if (!fwnode_device_is_available(ep))
> +                       continue;
> +
> +               if (camss->legacy_phy) {
> +                       csd =3D v4l2_async_nf_add_fwnode_remote(&camss->n=
otifier, ep,
> +                                                             typeof(*csd=
));
> +               } else {
> +                       struct fwnode_handle *phy_out, *phy_node, *phy_in=
, *sensor_ep;
> +
> +                       phy_out =3D fwnode_graph_get_remote_endpoint(ep);
> +                       if (!phy_out)
> +                               continue;
> +
> +                       phy_node =3D fwnode_graph_get_port_parent(phy_out=
);
> +                       fwnode_handle_put(phy_out);
> +                       if (!phy_node)
> +                               continue;
> +
> +                       phy_in =3D fwnode_graph_get_endpoint_by_id(phy_no=
de, 0, 0, 0);
> +                       fwnode_handle_put(phy_node);
> +                       if (!phy_in)
> +                               continue;
> +
> +                       sensor_ep =3D fwnode_graph_get_remote_endpoint(ph=
y_in);
> +                       fwnode_handle_put(phy_in);
> +                       if (!sensor_ep)
> +                               continue;
> +
> +                       csd =3D v4l2_async_nf_add_fwnode(&camss->notifier=
, sensor_ep,
> +                                               struct camss_async_subdev=
);
> +                       fwnode_handle_put(sensor_ep);
> +                       if (IS_ERR(csd)) {
> +                               ret =3D PTR_ERR(csd);
> +                               goto err_cleanup;
> +                       }
> +               }
> +
>                 if (IS_ERR(csd)) {
>                         ret =3D PTR_ERR(csd);
>                         goto err_cleanup;
> @@ -4819,6 +4854,29 @@ static int camss_parse_ports(struct camss *camss)
>         return ret;
>  }
>
> +static void camss_detect_legacy_phy(struct camss *camss)
> +{
> +       struct device_node *remote;
> +       struct device_node *ep;
> +
> +       camss->legacy_phy =3D true;
> +
> +       /* Find first remote-endpoint and determine if its a PHY */
> +       for_each_endpoint_of_node(camss->dev->of_node, ep) {
> +               remote =3D of_graph_get_remote_port_parent(ep);
> +               if (!remote)
> +                       continue;
> +
> +               camss->legacy_phy =3D !of_node_name_eq(remote, "phy");
> +               of_node_put(remote);
> +               of_node_put(ep);
> +               break;
> +       }
> +
> +       dev_dbg(camss->dev, "legacy phy mode %s\n",
> +               camss->legacy_phy ? "true" : "false");
> +}
> +
>  /*
>   * camss_init_subdevices - Initialize subdev structures and resources
>   * @camss: CAMSS device
> @@ -4832,14 +4890,21 @@ static int camss_init_subdevices(struct camss *ca=
mss)
>         unsigned int i;
>         int ret;
>
> +       camss_detect_legacy_phy(camss);
> +
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
> -               ret =3D msm_csiphy_subdev_init(camss, &camss->csiphy[i],
> -                                            &res->csiphy_res[i],
> -                                            res->csiphy_res[i].csiphy.id=
);
> +               if (!camss->legacy_phy) {
> +                       ret =3D msm_csiphy_subdev_init(camss, i);
> +               } else {
> +                       ret =3D msm_csiphy_subdev_init_legacy(camss,
> +                                                           &camss->csiph=
y[i],
> +                                                           &res->csiphy_=
res[i],
> +                                                           res->csiphy_r=
es[i].csiphy.id);
> +               }
> +
>                 if (ret < 0) {
> -                       dev_err(camss->dev,
> -                               "Failed to init csiphy%d sub-device: %d\n=
",
> -                               i, ret);
> +                       dev_err(camss->dev, "csiphy %d init fail\n",
> +                               res->csiphy_res[i].csiphy.id);
>                         return ret;
>                 }
>         }
> @@ -4917,6 +4982,11 @@ inline void camss_link_err(struct camss *camss,
>                 ret);
>  }
>
> +static inline bool csiphy_enabled(struct camss *camss, struct csiphy_dev=
ice *c)
> +{
> +       return camss->legacy_phy || c->phy;
> +}
> +
>  /*
>   * camss_link_entities - Register subdev nodes and create links
>   * @camss: CAMSS device
> @@ -4930,6 +5000,9 @@ static int camss_link_entities(struct camss *camss)
>
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
>                 for (j =3D 0; j < camss->res->csid_num; j++) {
> +                       if (!csiphy_enabled(camss, &camss->csiphy[i]))
> +                               continue;
> +
>                         ret =3D media_create_pad_link(&camss->csiphy[i].s=
ubdev.entity,
>                                                     MSM_CSIPHY_PAD_SRC,
>                                                     &camss->csid[j].subde=
v.entity,
> @@ -5056,6 +5129,9 @@ static int camss_register_entities(struct camss *ca=
mss)
>         int ret;
>
>         for (i =3D 0; i < camss->res->csiphy_num; i++) {
> +               if (!csiphy_enabled(camss, &camss->csiphy[i]))
> +                       continue;
> +
>                 ret =3D msm_csiphy_register_entity(&camss->csiphy[i],
>                                                  &camss->v4l2_dev);
>                 if (ret < 0) {
> @@ -5131,8 +5207,10 @@ static int camss_register_entities(struct camss *c=
amss)
>
>         i =3D camss->res->csiphy_num;
>  err_reg_csiphy:
> -       for (i--; i >=3D 0; i--)
> -               msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       for (i--; i >=3D 0; i--) {
> +               if (csiphy_enabled(camss, &camss->csiphy[i]))
> +                       msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       }
>
>         return ret;
>  }
> @@ -5147,8 +5225,10 @@ static void camss_unregister_entities(struct camss=
 *camss)
>  {
>         unsigned int i;
>
> -       for (i =3D 0; i < camss->res->csiphy_num; i++)
> -               msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       for (i =3D 0; i < camss->res->csiphy_num; i++) {
> +               if (csiphy_enabled(camss, &camss->csiphy[i]))
> +                       msm_csiphy_unregister_entity(&camss->csiphy[i]);
> +       }
>
>         if (camss->tpg) {
>                 for (i =3D 0; i < camss->res->tpg_num; i++)
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/pl=
atform/qcom/camss/camss.h
> index 93d691c8ac63b..ba3d51d9c0bf8 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -138,6 +138,7 @@ struct camss {
>         struct device_link *genpd_link;
>         struct icc_path *icc_path[ICC_SM8250_COUNT];
>         const struct camss_resources *res;
> +       bool legacy_phy;
>  };
>
>  struct camss_camera_interface {
>
> --
> 2.55.0
>
