Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DE1C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:27:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B7DA21852
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 22:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549405651;
	bh=8pTPD9Y7PLE2SKcD8m2OIZ9TL0E1jh9uzSx89Fr8NPg=;
	h=Subject:From:Cc:References:To:In-Reply-To:Date:List-ID:From;
	b=iJuwIUw2OmB9FvRh5F5YoXzygavv5iFVHaynpiEjHxtf2MGgABeT2aDjdMr3BMiWZ
	 dh30ihv8q8Oh5zBbN9pi4lDm6lnmZbILrYQoUtWBeuQglWVtcVRkwJtAfNNE77hsbm
	 6bJG1ReEykV2eQ4U59P8kdNow1EU7gzNjhYNVXyk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfBEW1a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 17:27:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:37442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbfBEW1a (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Feb 2019 17:27:30 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F3872077B;
        Tue,  5 Feb 2019 22:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549405649;
        bh=8pTPD9Y7PLE2SKcD8m2OIZ9TL0E1jh9uzSx89Fr8NPg=;
        h=Subject:From:Cc:References:To:In-Reply-To:Date:From;
        b=C7trYXo8SqOksyIbOo4OCWWXok26yn64qaZ7Bv25w6DzjNIAI9RKbbYQ7TVDHjZt/
         0PJnUqaejLnrrGQXxopU8x7h3AnyXK1mP6mPC+Dp/CmSD0kXPlurlqo7q73poNszHa
         SCNbh5MD/KA8dL5bBs2uCfZQp7FS6wpTj1jf1MOk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V4 00/20] Tegra210 DFLL support
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154940564864.169292.12172524763781613917@swboyd.mtv.corp.google.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20190104030702.8684-1-josephl@nvidia.com> <20190125134617.GE22565@ulmo> <0a7abeee-1b78-4f90-e94f-43c19eddb9b1@nvidia.com> <20190128075442.GA18124@ulmo> <a2cf3ccd-658a-e004-1e66-d4f9cf1026f1@nvidia.com>
User-Agent: alot/0.8
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Joseph Lo <josephl@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <a2cf3ccd-658a-e004-1e66-d4f9cf1026f1@nvidia.com>
Date:   Tue, 05 Feb 2019 14:27:28 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Joseph Lo (2019-01-31 18:49:38)
> On 1/28/19 3:54 PM, Thierry Reding wrote:
> >=20
> > the same applies for clk patches. Stephen's acked all of them and I
> > think all of the series is good to go. How about if I pick up these
> > up in the Tegra tree and let this all cook in linux-next for a week
> > or so and then send you a pull request with these? Stephen already
> > picked up a couple of fixes for clk/tegra, but I don't think any of
> > those would conflict with this series.
> >=20
> > All of that said, Joseph confirmed that there are no dependencies
> > between these subsystem subseries, so if you'd prefer to pick up the
> > patches into your respective trees, I have no objections to that.
> >=20
> > Thierry
> >=20
>=20
> Hi Rafael, Stephen,
>=20
> Gental ping. Please let Thierry know if the cpufreq and DFLL clock=20
> related changes can go through Tegra tree.
>=20
> I know Rafael did say [1] it's okay to go through Tegra tree in earlier=20
> comment.
>=20

I am happy with the plan. Thanks!

