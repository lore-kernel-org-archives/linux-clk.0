Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B23C43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 20:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5415F214E0
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 20:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567801893;
	bh=20grs7Gqqchzro5nWBOpPISHzAksfuflzl2AEwFrb5k=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=JInLcl+UdcTMVEDN9ZQ39zf1dZL1JuK4vnAwxbsmhJHrMO0OyO658gYRdZ7hWoVmQ
	 oVa+6HdTRzpA5yr17mi7+QfKEcG/5EL8BiNuBpjQ637M1sfX3Pvq97XDwjNz6HQPpF
	 gCmNDaHNbK1zbIpGc+tOe331FTa/fhD3cumfpKTQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391161AbfIFUbc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 16:31:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:46836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389915AbfIFUbc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 16:31:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 936A22070C;
        Fri,  6 Sep 2019 20:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567801891;
        bh=20grs7Gqqchzro5nWBOpPISHzAksfuflzl2AEwFrb5k=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=eAKiu8m3HYdMJroSvMHGlkhEyU2OKcPdwxWQw4Jd+KimsSqXP1LxCkgYIkMx7ydY5
         jv8AhiQjyaZNQf1sjsldTv+eGQcDR7xdJ6H9/+bXP8xuyPMhE/MaqCjK7tvBSQ3BpT
         BE5j6/8OR/86cd7QooJ4JK7CXm5hGo2S9HyVx2Y8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAL_JsqLpVDJBh5qZwudncB8sggb85f3efqs1z9EA+zbVPWX++g@mail.gmail.com>
References: <20190823131401.4011-1-govinds@codeaurora.org> <20190823131401.4011-2-govinds@codeaurora.org> <CAL_JsqLpVDJBh5qZwudncB8sggb85f3efqs1z9EA+zbVPWX++g@mail.gmail.com>
To:     Govind Singh <govinds@codeaurora.org>,
        Rob Herring <robh@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Subject: Re: [PATCH_v3 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock controller bindings
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 13:31:30 -0700
Message-Id: <20190906203131.936A22070C@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rob Herring (2019-08-27 05:27:19)
> On Fri, Aug 23, 2019 at 8:14 AM Govind Singh <govinds@codeaurora.org> wro=
te:
> >
> > Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
> >
> > Signed-off-by: Govind Singh <govinds@codeaurora.org>
> > ---
> >  .../bindings/clock/qcom,q6sstopcc.yaml        | 47 +++++++++++++++++++
> >  1 file changed, 47 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6ssto=
pcc.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yam=
l b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > new file mode 100644
> > index 000000000000..39621e2e2f4e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: BSD-2-Clause
>=20
> Dual license please.
>=20

Yes, please fix the binding.

