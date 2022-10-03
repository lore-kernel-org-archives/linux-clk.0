Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBBAC4332F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 14:50:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbiJCOuv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 10:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiJCOue (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 10:50:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C8F2FC1A;
        Mon,  3 Oct 2022 07:50:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0CF7D61127;
        Mon,  3 Oct 2022 14:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1914EC433D6;
        Mon,  3 Oct 2022 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664808628;
        bh=XLLdphvKCzZ4t4WwbckCMz7Zt8JS/3i7dwWsjkZq/vE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iwguR5/VjxupEk25Sa0MXGCyOX28o8clF94uICJbTYfHRr7k8V6Z8C9uiaBIV7Dow
         EpySlQ2oZexBrFfjvCfluIYkodChiqbM1v2Fwz8/Ny13zS1CMuwNM7ffii2HJu5dFE
         UbrYEkqh+vZFNc2YIW+kpAvJI0lb3cwzi6Pms8Fs=
Date:   Mon, 3 Oct 2022 16:50:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Michal Simek <michal.simek@amd.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org, git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
        mturquette@baylibre.com
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Message-ID: <Yzr2sbrt3uZwALnz@kroah.com>
References: <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
 <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
 <20220930213924.GA1079711-robh@kernel.org>
 <6e58837e-896c-7069-7913-2afb90af5e95@amd.com>
 <b495804c-cf04-4512-ac05-424eded46468@linaro.org>
 <57989d3e-a186-1d67-cff9-6a059f94ebd3@amd.com>
 <f611237f-0401-9e3c-3a21-79b33141bb51@linaro.org>
 <YzqaXthSLBbwU+5V@kroah.com>
 <a8576f0e-b5ab-33d1-40d4-5f25c66616c7@amd.com>
 <053c0831-6bce-ff0c-a511-6f292127ca63@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <053c0831-6bce-ff0c-a511-6f292127ca63@amd.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 03, 2022 at 12:41:34PM +0200, Michal Simek wrote:
> Hi again,
> 
> On 10/3/22 11:59, Michal Simek wrote:
> > Hi Greg,
> > 
> > On 10/3/22 10:16, Greg Kroah-Hartman wrote:
> > > On Mon, Oct 03, 2022 at 10:10:38AM +0200, Krzysztof Kozlowski wrote:
> > > > On 03/10/2022 09:58, Michal Simek wrote:
> > > > > 
> > > > > 
> > > > > On 10/3/22 09:23, Krzysztof Kozlowski wrote:
> > > > > > On 03/10/2022 09:15, Michal Simek wrote:
> > > > > > > > > And this is new IP. Not sure who has chosen similar name but this targets
> > > > > > > > > Xilinx Versal SOCs. Origin one was targeting previous families.
> > > > > > > > 
> > > > > > > > Do we need a whole new schema doc?
> > > > > > > 
> > > > > > > It is completely new IP with different logic compare to origin one.
> > > > > > > 
> > > > > > > > 
> > > > > > > > It is not ideal to define the same property, xlnx,nr-outputs, more than
> > > > > > > > once. And it's only a new compatible string.
> > > > > > > 
> > > > > > > I can't see any issue with using dt binding for xlnx,clocking-wizard.yaml
> > > > > > > 
> > > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > > > > > > 
> > > > > > 
> > > > > > So we already have out of staging document:
> > > > > > devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> > > > > 
> > > > > in 6.1 yes.
> > > > > 
> > > > > > 
> > > > > > and author wants to add one more:
> > > > > > devicetree/bindings/clock/xlnx,clk-wizard.yaml
> > > > > 
> > > > > as I said it is completely different IP which requires
> > > > > complete different driver
> > > > > but IP designers choose similar name which is out of developer control.
> > > > > 
> > > > > > 
> > > > > > Shall we expect in two years, a third document like:
> > > > > > devicetree/bindings/clock/xlnx,clk-wzrd.yaml
> > > > > > ?
> > > > > 
> > > > > Developer definitely doesn't know. If new SoC requires for the same purpose
> > > > > different IP with completely different driver is something out of developer
> > > > > control. As of today I am not aware about such a requirement and need and
> > > > > personally I can just hope that if they need to do such a change they will be
> > > > > able to keep current SW driver compatible with new HW IP.
> > > > 
> > > > Then please start naming them reasonable, not two (and in future
> > > > x-times) the same names for entirely different blocks. And by name I
> > > > mean compatible, filename and device name.
> > > > 
> > > > > > > also for this IP if that's fine with you.
> > > > > > > Only xlnx,speed-grade can be defined for previous IP which is easy to mark.
> > > > > > 
> > > > > > That old binding also explained nr-outputs as "Number of outputs".
> > > > > > Perfect... :(
> > > > > 
> > > > > Anyway if description should be improved let's just do it. I just want to get
> > > > > guidance if we should update current dt binding for similar IP or just create
> > > > > new one as this one is trying to do.
> > > > 
> > > > IMHO, new binding is extremely confusing. We already have support for
> > > > devices named "xlnx,clocking-wizard" and now you add exactly the same
> > > > (clk=clocking) with almost the same properties, named
> > > > "xlnx,clk-wizard-1.0". For a different IP?
> > > > 
> > > > How anyone (even Xilinx' customer) can understand which block is for
> > > > what if they have exactly the same name and (almost) the same
> > > > properties, but as you said - these are entirely different IP?
> > > 
> > > Maybe we should just delete the staging one (and the staging driver),
> > > and start over?  No one has taken the time to get the staging driver out
> > > of there, so I have no objection to dropping it for 6.1.
> > 
> > As I said it is be out of staging in linux-next. When CLK tree is merged
> > in these 2 weeks we are done at least with this driver.
> 
> FYI: Here is link where I asked you for your ACK to get the driver out of staging.
> https://lore.kernel.org/all/Ys%2F%2FaPLkLGaooYYw@kroah.com/

Ah, good, I forgot about that, nevermind!

greg k-h
