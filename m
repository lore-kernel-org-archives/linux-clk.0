Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F206448CE2
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032318; cv=pass; b=R6PKbUMYuyEL6EznA40atK3ZEjKP+HjQ3X8QrfPHc0/qaJdxplFUTDSES3LJAfmQKovXIpsSb9X9UvSHuVdOkFzw0wSFhiTe1LxhuJRVmfcEY5HzPHqFnD6QxDSQTdRE0+AY6I38x0tCbuTvlTjtuDR0xZ1Ryyjr/utaV8t60VI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032318; c=relaxed/simple;
	bh=ji3uIpmyKNhCWk9sN5ktVEemOSik2hw33b5vEOk3sQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JO0m8vmLEI/qV3jRXd5fsinWyHQ2bKB+Xii1fCVDki1zo7Eh8ay2YJQySL4wjzM8m3wzyM4Wk8BNJdZoBLR6whJRJWwQs0eZdrBLnjp+1EGlL7WpGvX69OGQeKizO73os7hbdcd4r8X1bRsjaGjDHNSV78Z7CbzC4cuo/+eR4iM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pc0ZlMeE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIb2hTp9; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pc0ZlMeE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIb2hTp9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBOuO9441327
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 12:31:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=; b=Pc0ZlMeE/Tc18FPN
	qe3RnE7NymV3SObOIc4FWc/ZMmsgt36U1cCl8yZUhYe7hZglmy8uhaTuB/s83WLL
	Kq/EvZEn+mmdnNSoFutGXKKBkqoB3Uv/jXvuBI0/yfLbHb66Ig9BvOd7EICXkRyr
	Db7oeuQkryAz6x4aGnDLAZXZrPJ7nPmQKWDcxLvuPyjFkVKK3SjAfC+hV1G9mVbd
	oOv/HjEKt4KPkVMfGzAH1ex/t//dsLNli7HfurHC+BUpDUS33YPd1js6RPv9rpwc
	+yhvdNhoIErbIlzzMeQJRzgNAcVWj9actgAwf0vlMRtNwA8AShY4G5sDGs95XVkg
	Hu2hEQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgudh238-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 12:31:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-904ee4473a8so47245856d6.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 05:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784032302; cv=none;
        d=google.com; s=arc-20260327;
        b=frFvtL6CUDLYDhHbkyXE0pnehCTQ+rVOvJdEambSmznrvgEf8QFZoKSpKGyH3ACKX2
         NT52tvu9CFYX9qpCnR99HOJPpUqU+mVIm0cBSZe3lWPJf/apzZpdiETnd/k9/bxyX9kK
         YyeWoDUWwawAF9KMjQ23wgZW66LtfxdlyWVFAsM8+Ng+XJ1RPFaqvaI930QPEsZNMwtl
         aDDEoZcdpnG5ImbzGSCyclLLUScHlSOFeM1m2pLmhNmONpWuzoFTXH+9d886vh6jtRkx
         rXxSBToNno7uu8J4x8SHTMLJ0DhDOWwlhWfAKPWC8Jxo/aRauHdeg2YleGhhIC9a4519
         HRBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        fh=x7ksLDD/zWhavk0m5LAY7CbVH1Zm/4kHcTBGbIQWOY8=;
        b=hr6ah6oRtgogM+6AhHdMmq3u7WpRTzMwI/W+wyCtbOiPOkybgSrJs1F/TE8kPIKelc
         H3SFg7l56GS9GtVhmTUKw9axtaMSwy983f1DrUdnExkhCL2Q/+Jy6RaWjLjIDOknSVXj
         3tuFD6P1qJGIlCkI/A0kDj7u4sOjV0yAm8MDQO9UH6R/KyGobFr2UuklA61O9C4Q8vS6
         Pp2e6V5qjki+a6ZtlskyLxmEKA9jhS+8XkZbTdh7psIM/hhjQwlbfCx+ClOHX1mOt192
         Mkf0uJChE3EGeea5K/ebVR6irXfrVbEzGHJDpo6wNCEngomTjjeBerx3zddjgdhUTnhV
         QFMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784032302; x=1784637102; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        b=CIb2hTp9sJ9LNPmkTS8PthiNnwWChroVR6yZEn7mgAn3TMVA1bNWGjhDx69l9L41Km
         GIBgFwiMvxh0oi1LmrU727+Y6mS8BPmVhdogTOBKwHxywhWbWWeD0u2sGfydrpw5Ltqg
         XnuPhL0CqSMKSdtYyFMJIxCBxJ/TuQPNKskm3lpn4fzWKLYpw4+UsWfTVA1HVIz5dDNo
         EUTgv4StgM/GC5AP0dk9F9++hqgAdCUWLYD0cCaxGRj955KvTZb9WqBgp2IVC3hwKrqM
         +Mj78sEcOWFPOxLJk/KMpJ1q8h7iSVgT6V/NeSmhfcM7eaRriVLa8YUQbbww1hMIsO3p
         V0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784032302; x=1784637102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Aolgj7ExGp7W3yDVV9JBeGUKfuVnW2a9wH6o4+naGQ=;
        b=Y/0cezTCIVcXxHefvmIOaija/g+13FVR/DbJ701wEd8fuEdSEWTWa6PkvMal4zPEod
         N0G23/wpgt6HYzBWgMvavONHQW7cSjCIEoo1HQCF3Nc0poh/yySQiwKz3FcXZ14buIZV
         K6ePDsFnaN4r8SN5dO8KPKzracHJVhMGW4u/IrzMsCpx4P+zsNF/u31x0RaLgTfkYRi6
         O7CES2wVpFixYsKeol3b/E3e/fT/r+0WoMl/23Ef/ka1OOs0IEQjSjOOaazlU8+MLxQr
         agQDIK1BOVxIiXSdK+HxNCvtNTBMo37O4JQCkB1X4grIqMnEF9ItzlBGfPiB+Qr3iSVI
         7eyA==
X-Forwarded-Encrypted: i=1; AHgh+RpXz06mam/1MAo4IHhhsj/dUCcbUe+ocd4A/ODgY5Xq651vqbkg+4E8AN70ckjcwF+O1mww9Xlujx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLtxDfROgqgxyf1iHA6WT027/46cxMpzfQqwFFawPg07tDtsh0
	vKWH+Q2Y5GCIsuKSzvnz9mK5G5VfetU+0PHPd18merebAqxZVdupRK2LvJGyBkpYQyTgkVs7+r1
	AwCfUIIwtRFsP+5DRSYkB+lqCIVwQuSUTqWhMVdT1lC6FLk1UF/5DMBLxqehpMk754IGQLYFC5j
	BQBGJx31GdNDIhx/AQ1ZM3HbhyeTvxz7gLWTqZqw==
X-Gm-Gg: AfdE7cmstrjiloquyDa5JNtHhUi22IISjUxLE+t5+jvh2QJ4aN3yBRUeyJMNthGdyaF
	WT6L/ORk4VDPn4XWHhCnhF5Ia7X4ZWUUBpP1RLRbthgTjOAxv38Q+EbK97jnadih3+HKJ9ZdLRL
	GJeJGWXW3XtTYZQrUey6/o5DEeAEBHBq9+U2vq483buVQM/YaXDatDk5IhiYU7xJOMHfRX
X-Received: by 2002:a05:6214:3385:b0:8fd:6e12:9710 with SMTP id 6a1803df08f44-90747d1cbf4mr35409366d6.62.1784032302417;
        Tue, 14 Jul 2026 05:31:42 -0700 (PDT)
X-Received: by 2002:a05:6214:3385:b0:8fd:6e12:9710 with SMTP id
 6a1803df08f44-90747d1cbf4mr35408856d6.62.1784032302033; Tue, 14 Jul 2026
 05:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <fce1aa52b181082f260a824fe38baf033ba8f56e.1783505329.git.geert+renesas@glider.be>
In-Reply-To: <fce1aa52b181082f260a824fe38baf033ba8f56e.1783505329.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 14:31:30 +0200
X-Gm-Features: AUfX_mw1w9aani-kekqL_J3mlM9LGY41ZFq3mfPK3ex6sNHNGM7Yu8pRBTDGFLI
Message-ID: <CAPx+jO8W3MdqnJ-4EgbmFvODuX9BGcyww=YRn=_CknohfSWOjw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] pmdomain: Make genpd_get_from_provider() public
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 6JvynPSPfst17BhB1M677NzEn0hfM1Ph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfX9886MipRD3x7
 8vuuaOKVm+C3OYRzSUdFif5HsYorObm+g86kuX0rb7nd7sIVSs8wGgY07kod52tQmm3xCulha8u
 M6CH25fv/bdB//4LqrIoqcxUDGteUk9Rktt3RKA67B8YEA0LyCLPZgY+j2inmal5PrMvIoeqL7p
 n8Cp6eRwWAIm4aeC4W/rIv+dh8yjEmhMulBVk5rPFsZDgNHNvtGkqxRlZuaLM5H+VWuKYRzNEyo
 BlalgbTqlHisbXSxWtKSnNx4HaAJ6eSLaXMwuc03CspIs7V8PkXZwkXf+mQDStpuBDHAfopISFK
 wSFW/gUwcpLkpKBKatJ95hwtfNBBZFsIAx/HsYa85djLiU1/o6zdpRt+UVwNWCr/nzcOsNzLquI
 moI1hFa8p8xe9WVa5Q8KDzCk9N5z8Uq8GXKN7odkTV5+zxDIpGOY3nCCozm9nJ1Rzj8iMvXj8Ri
 /i5QBM4H705mYQ7irnA==
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a562c2f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=BvHvEDz1nzgFWKTw3gwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzMCBTYWx0ZWRfXx1bWBpWi28L0
 s2dZoyQrxtcJkH/MX2PJJFpKo/HsQZJVx2QGZEOaalLTMntfXb0ImdGGrdG7W9dSaXSSoOqXnr2
 H8R/2s6zXuvM6nsbKiJFJP9XZTUp82c=
X-Proofpoint-ORIG-GUID: 6JvynPSPfst17BhB1M677NzEn0hfM1Ph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140130

On Wed, Jul 8, 2026 at 12:17=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike the corresponding function in the clock subsystem
> (of_clk_get_from_provider()), genpd_get_from_provider() is private, and
> thus cannot be used by PM Domain drivers.
>
> Make it public, so it be used by the R-Car X5H Module Controller driver.

I am a bit reluctant to make it public, because of potential abuse.
Moreover, there is no protection or reference counting of the genpd
that is returned, hence the caller needs to be careful.

That said, if there is a strong argument that it's really needed, I am
fine with it.

>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - No changes.
> ---
>  drivers/pmdomain/core.c   | 4 ++--
>  include/linux/pm_domain.h | 7 +++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290677c..7de3c693ddd9a2c8 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2900,8 +2900,7 @@ EXPORT_SYMBOL_GPL(of_genpd_del_provider);
>   * Returns a valid pointer to struct generic_pm_domain on success or ERR=
_PTR()
>   * on failure.
>   */
> -static struct generic_pm_domain *genpd_get_from_provider(
> -                                       const struct of_phandle_args *gen=
pdspec)
> +struct generic_pm_domain *genpd_get_from_provider(const struct of_phandl=
e_args *genpdspec)

If we are going to do this, please add "of_" as prefix for the
function to have consistent names of public genpd functions.

>  {
>         struct generic_pm_domain *genpd =3D ERR_PTR(-ENOENT);
>         struct of_genpd_provider *provider;
> @@ -2923,6 +2922,7 @@ static struct generic_pm_domain *genpd_get_from_pro=
vider(
>
>         return genpd;
>  }
> +EXPORT_SYMBOL_GPL(genpd_get_from_provider);
>
>  /**
>   * of_genpd_add_child_ids() - Parse power-domains-child-ids property
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f925614aebdbc914..95fd7e63e87e2095 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -458,6 +458,7 @@ int of_genpd_add_provider_simple(struct device_node *=
np,
>  int of_genpd_add_provider_onecell(struct device_node *np,
>                                   struct genpd_onecell_data *data);
>  void of_genpd_del_provider(struct device_node *np);
> +struct generic_pm_domain *genpd_get_from_provider(const struct of_phandl=
e_args *genpdspec);
>  int of_genpd_add_device(const struct of_phandle_args *args, struct devic=
e *dev);
>  int of_genpd_add_subdomain(const struct of_phandle_args *parent_spec,
>                            const struct of_phandle_args *subdomain_spec);
> @@ -492,6 +493,12 @@ static inline int of_genpd_add_provider_onecell(stru=
ct device_node *np,
>
>  static inline void of_genpd_del_provider(struct device_node *np) {}
>
> +static inline struct generic_pm_domain *genpd_get_from_provider(
> +                               const struct of_phandle_args *genpdspec)
> +{
> +       return ERR_PTR(-ENODEV);
> +}
> +
>  static inline int of_genpd_add_device(const struct of_phandle_args *args=
,
>                                       struct device *dev)
>  {
> --
> 2.43.0
>

Kind regards
Uffe
