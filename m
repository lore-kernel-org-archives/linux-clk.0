Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168A38F651
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465476; cv=pass; b=Ep4SzUSVMNX/TmBC0cYgzyIFSrCpLjUKhTKv9rP2ikiRzr6KlhJ2/3BGI5plbsD/AqJ4Esbx0JjddzZwdwFO3YUlStu/zSl0oHeCRDw+JDWTFK9uwti+iwmN/4fJhl390cJEnvxZxkHfyi6EgdPi586EI1ibtjp9FxACbEAlkxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465476; c=relaxed/simple;
	bh=bnMbNVVj2v7D9H53XLbDJbbR1wetYWN0pnhL4iZAsKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qh8mWudMc8MezdHQ/GTkQ9Hc4ZSGi1PF+HJJfLP0He3/xJPLgDIvob9nA+Bni5H9+sph67PILDal8WpQgF5IMlVgdH3kV1jUhhw+E7oH/xSRvRH4k395X5kU5k/EKnMfE5p+1C1baFtMoZkk+vuZAZQr0itrncr5U3G6/gt07oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CswX52JO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BqO6+CL0; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CswX52JO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BqO6+CL0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hDaO064691
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=; b=CswX52JO4Piek7S1
	Nh5bNU4VoO1KLQKJHZi2GoNsBO93uwTsHWczoWdD5kh+m9XZtxEd23AQrjfDPOqB
	tX5Cjr+nIN1hQekrHcniYNtSI7eA+CV1XEJVBv9UwvTrgzNsnyjK9evluCd9rGjz
	+DkpQKne67MJuncyzn9NhnAmvFCbziH8n3MzIJ9uckeogat1TJEpjZHYbk5E7GFE
	hnkRb8LlCj/uwSTXPsevc+/qgw6cPGOY0d0/N1akFR8jVQ/8lqNtqBc/KHR1wL0w
	7WxbNJx8Mp54CGlfZ+XZn3I5piX949TDmuYC234iyBEY7w0iWqTsMCg78sI/1IXC
	z37DOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41urm4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 09:44:34 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a05d645acso725818485a.2
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 02:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789465473; cv=none;
        d=google.com; s=arc-20260327;
        b=E2zILG0peixkZ60fwWQ+sIV43bfEW9B7IP0WhiMBI7/8TSiSoK4XwT21f4D+m0VHtM
         94l1ltlP7B/X/c2kei4cwvtBWGPO4BnnmzrBPtfFbJtsDiBu3fhtMZZpE/onT0nucoRk
         K7eEMw9uksgbunjgCRL//GM3//YY9+O9f4s29Siq53ayZrUpNmKuysOi1WqVuOwfLuMe
         PgGCIa1lWlWUiUBvvzorKTBCkjUM3c/YzmFJdBKyNE/ezoI2FCpagImVvIaNxG1oMQZ8
         PEMZYQANYXfjIiFl+90yUl56JN+0v7blD5hgDPOsasCQt04NVxb6PKnxh/S/tMCDmZYq
         AD/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        fh=c8wwBbxw8jkje27lP0BYzRpiuLaJofGsfpkRH+fnXPM=;
        b=bQlhiR2AHwJ27ovDcEAjh1lR8oCYdocDO1BWG17zGFdHTv9G1WjiLlceydJCIdOWZi
         BDV36ITBr8BLrm2p1T9Yf054YLnHP3GwAa+KTSuSago3y4txrYGeUPCcXbS6st9BDuiA
         GyPcKOYG/wI/UgpA7iQy5019eGQtGvsDtCSyEbwI0plPhn5jxJVYX895ZdTknLnt8TzU
         OPRx36n09u7PqtUhr79ZTKHZpgB/AobX0kqAirIjMfwZKc7KyWQxx5jYi4RBWly54w0m
         MR8YfWNm34vLuW1ZyfMfSRs4XA9JPPj0O4JDMT7+4EYaURXws2o4tGuI8seqi1cJfM6Y
         T0Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465473; x=1790070273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=BqO6+CL0bnBgpS1KoPFMfcK3hk9hoxkrNc2XYwBLMu14pNQTHeeR2OMQd98FD4vpJg
         vZ/lrPhoaEgsekh7SyNuP+wx/1toQyIeZLR9WJCeavjV2DfV66q1aHYLsT83oKAGvdT2
         ZP5Vd6eJA/k6EQ/CWpGYkJIX7TPJos0MHHBXon7x+E/Xx3MAxFwTnwmSDDi+Y+/mLsm3
         4AGYO3DW70kx68QyNv2dirIAomy5i0hl0UcWmTaMLboU9PcrRpag4PUXtqPlaUEKg5rd
         /iYf/vKf2G5b7AUoK/bhcExLygqWoa7ck92fChzWwtr6VrHgI0H6T/W8CB5ObCp5gZA2
         DTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465473; x=1790070273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fxpNJamNTHEgMiR+YPy8hcOjc4iu052BMQz4IBDT98=;
        b=SYhMyOxiTuBS3zTkZsRh2EnpHDPM+XhHDMfTG+FKWiMtwg/yNW02ePK1lHJmYATl2T
         pCo115l5N2fg+Q7/R8Gscqc2P23/3Jz5kFl0bAtw1sVNToDKXXrJjooVhSXoYWTp7Zfw
         N1yW3v2IBo9bbgUiBtU6+mC0UkNoUmsks1jlUAXQHuNivFCMRZfU+cEvtGJwn56rAeEt
         uO3z6usrdkosBA6+6YwiihUH8HYKVtKMFK8vWipgmcVx3Dt/2qyWZph+aBMpkKvJ4QT4
         P/6f4RZ2Q+4CtdrFVd9fKwK2u2BbtALza9tH4XMb1g67t3hxCXi3CiM82HXaBoIw+Eip
         Uofg==
X-Forwarded-Encrypted: i=1; AKwUvBx8Q38bkVeNhI8Ps8mZuy6onoT1BbgwmS3Y5iiiUiROaaN9h88q0IGE9mlKpQomwCxY5/FcrwQkuYY=@vger.kernel.org
X-Gm-Message-State: AFuF++kYT9YwRvQru0haxwuV9MW3heIi63pjlm7uCKdiEYruyzN9xgGm
	3r6AF208sRS5FEqULOCpf7vsdHEZnMFLog1eK3QuzdBwX53h76DOY83HA1Rd2hs/vnvib3Z5ZaQ
	qzJLvQhWX4lG40+vaYzjTZiN26ONrGrQxwF1JhYdA/hgwfaGpBixX3A3SR6phExc2thtGJ941ZD
	k/OoUG1CeUysbp+YUamcxcw7HOlf7P6zNImjShYQ==
X-Gm-Gg: AYBFou3auFIM/oBjMLD1dBWc2ieXSwLqJ+Ace5OfSihnYt3PHH2qgnLwtvF/7bdXwxu
	ESpcneOs2+hUyKQASnjpcDUtikkOWpA8HEa3SlOhtlXrj9dDuns4e7icDvF00OOWGNfg6IqvB52
	58q+gu2x8+ryhx2CMMtKzkHTbL5YQA53KMfUa3G6YrXVZwECjuWkJGqEjPvEGNjT5RW7bcYL+VH
	CyKKwZdEEKqfJeub72/bxwUtAeK/0Fco1JIT5z7+NL0SvrOc008w8LtzrYoO47AQ8U68YkiIc5n
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id af79cd13be357-93a299edea9mr1021969185a.39.1789465473212;
        Tue, 15 Sep 2026 02:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:1994:b0:92e:4927:2002 with SMTP id
 af79cd13be357-93a299edea9mr1021965685a.39.1789465472779; Tue, 15 Sep 2026
 02:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-0-e2197a3e2551@linaro.org>
 <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
In-Reply-To: <20260906-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v17-5-e2197a3e2551@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 11:44:21 +0200
X-Gm-Features: AcwNN1UBt5xNb7VDMYWD4BT9h_axCpKQfZrvwQ0bvr4VpK98SvAM9POncAzr6Lc
Message-ID: <CAFEp6-1meC7+XV3nVUiqivnpPQwDnDBRNCtmDZ-OMG=sLkxAvQ@mail.gmail.com>
Subject: Re: [PATCH v17 5/5] media: qcom: camss: Use data-lanes starting at 1
 for new CSIPHY mode
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
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfXypk376bQprx/
 kMxDbFbz2nEupPBvC1jOEptAII7Uh2b8tm22vbTiGXruoU3E8pIvan/8frQXTCC/6ddyuYfgFue
 FOjScxJQbbA8P1aEPAZJps8TYy306q/d9TngNOCjrohzAQ6j1N5kxV/PN4auZnc6uFf+7pFNpw9
 mxwlnCYflI054oJzcD13BV47mXd5Bfz9HCW+xfW2G2UnXWN1TTXBZ4T7UuQbJs51IZ+5lKkbmtg
 7/nKctc9+27OWxp9chd2n2IrozzvalHx2ERikDSCB4upvZiLkGn60JVjh1VLXZFpmooNnvxMwBX
 EOVR5bcOG0+boHctk3j6yCyrkboqzru2TJMSwyrK2w8IsH7XHC+Hx5XL9P41aFbb/qZJE/D188Q
 QSRkqtMPjDTo3WCZsAyF/Dsnm7VPXtPpQav1T8/JZZIgv7u08sLiDS7IZOGJEW9TvZgOmwZM2vg
 ZVW5+LL8DUaJsLufh5Q==
X-Proofpoint-GUID: 9_wfcMdxTbpHSpWS99kaCZjFMx6ncQ26
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa91382 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8 a=aw8XXKZHl-0D_llVJ40A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9_wfcMdxTbpHSpWS99kaCZjFMx6ncQ26
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEzOSBTYWx0ZWRfXx8qwemstcF+l
 rOBEPl4U89Ldw15ioK1OSmtPmWApT6Dr8g0+FwM230A4+1o6p/G8kQ9dKS8yrm21FOeJkldZvF+
 2NUnlns4pODfqxUwiJVQT0eTz8e4psk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150139

Hi Bryan,

On Sun, Sep 6, 2026 at 4:17=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Introducing a dedicated CSIPHY driver community feedback was both to move
> to data-lanes starting at index 1 on the PHY side and also to match that
> indexing scheme in the CSI decoder - CSID.
>
> CSID consumes the data-lanes property to determine which CSID lanes to
> switch on. For indexes starting at 1 we need to amend the logic somewhere=
.
> The PHY side code normalises the input data to register level meanings so=
,
> replicate that logic on the CSID side.
>
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.
>
> Existing bindings are not affected.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 84097d82d99c9..07b3cddca5840 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4742,7 +4742,8 @@ static const struct parent_dev_ops vfe_parent_dev_o=
ps =3D {
>   */
>  static int camss_parse_endpoint_node(struct device *dev,
>                                      struct fwnode_handle *ep,
> -                                    struct camss_async_subdev *csd)
> +                                    struct camss_async_subdev *csd,
> +                                    u8 lane_base)
>  {
>         struct csiphy_lanes_cfg *lncfg =3D &csd->interface.csi2.lane_cfg;
>         struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
> @@ -4777,7 +4778,14 @@ static int camss_parse_endpoint_node(struct device=
 *dev,
>                 return -ENOMEM;
>
>         for (i =3D 0; i < lncfg->num_data; i++) {
> -               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i];
> +               u8 lane =3D mipi_csi2->data_lanes[i];
> +
> +               if (lane < lane_base || lane - lane_base >=3D lncfg->num_=
data) {

I agree with Sashiko that a used lane index can be greater than the
number of active lanes.
So perhaps we should remove this test, or compare it against a fixed value =
(4).



> +                       dev_err(dev, "invalid data-lane %u\n", lane);
> +                       return -EINVAL;
> +               }
> +
> +               lncfg->data[i].pos =3D mipi_csi2->data_lanes[i] - lane_ba=
se;
>                 lncfg->data[i].pol =3D mipi_csi2->lane_polarities[i + 1];
>         }
>
> @@ -4794,6 +4802,7 @@ static int camss_parse_ports(struct camss *camss)
>  {
>         struct device *dev =3D camss->dev;
>         struct fwnode_handle *fwnode =3D dev_fwnode(dev), *ep;
> +       u8 lane_base =3D camss->legacy_phy ? 0 : 1;
>         int ret;
>
>         fwnode_graph_for_each_endpoint(fwnode, ep) {
> @@ -4841,7 +4850,7 @@ static int camss_parse_ports(struct camss *camss)
>                         goto err_cleanup;
>                 }
>
> -               ret =3D camss_parse_endpoint_node(dev, ep, csd);
> +               ret =3D camss_parse_endpoint_node(dev, ep, csd, lane_base=
);
>                 if (ret < 0)
>                         goto err_cleanup;
>         }
>
> --
> 2.55.0
>
