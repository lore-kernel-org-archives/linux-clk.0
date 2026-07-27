Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF393630B3
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167313; cv=none; b=RXsQnscet5yFmUdQmPKOx2m57maN7J5ex9YTXQofRR77WPtWuN+W5uolkOjORrl2vu77rLU3p1P+6XYEQa4D3Tjj7LYEnmGHqXCmdGC9KWD0elmWV7xiYO9YnYoV8+o4W4kWBvIXQ1/9fYORcJBeocbcFveQsqlr2KbejIUgw40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167313; c=relaxed/simple;
	bh=+CJf0I8kXRaqdu5m0kltaAJrd0vSOme9F6Z6+c1yD0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajPnVwhhO2uBJwPRbaYlxgpW8Bw1U7hL8vK1XpKBODH2q7P8Ki2aKZoEezx4YpUksHNZgWIng22ief432FwznwbdKcIds3puGyHQCl5aGxfgJAEw/fhK3z3VYY4U+XtsrONAnYb0YQpNJx4yh7nF723Ybpap7fXkxdPht9jPn40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jyy6t23v; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rt5Oz6VB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jyy6t23v";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rt5Oz6VB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785167309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2HmQTvTcT7QkqefKZGOjPiGMZ/ZgGZCcwnmf7IF3fIU=;
	b=Jyy6t23vBJKx6/Yp6w3jaNaD0KX74HR6Wec+UDKh7yCGqUDXQ9ZeJuGKl5qcLkQxxuIBBD
	/yO3PPRVITdRHu59vehTkPNW30p9WLJZu2udCNsRgeeBBFwrjQb23mxfZjy7GANMFnNdwF
	koxfUJp9oLlyunIGTwYIXNuOIF5ZGkw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-9gYymijgNOqgIPg9PZLyWQ-1; Mon, 27 Jul 2026 11:48:28 -0400
X-MC-Unique: 9gYymijgNOqgIPg9PZLyWQ-1
X-Mimecast-MFC-AGG-ID: 9gYymijgNOqgIPg9PZLyWQ_1785167308
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c07f25de2so25063331cf.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 08:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785167307; x=1785772107; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HmQTvTcT7QkqefKZGOjPiGMZ/ZgGZCcwnmf7IF3fIU=;
        b=Rt5Oz6VB9qJ9iuUBjC8XECJRLdojF+vBJykdYiT0z2twBKBt68aY9nhzIiewlRs39z
         YrD08Oc7estv/G1+sjcw5C2YQjJ1fwXnRCK2I/VzxvgkwjTNFFpYEAGEWm1GCZ4KAKUV
         3s12i3p1OclSOwotvg/iDSilBtc1VDstg2v8+2EOpCt1TgRfva1AFQIhiMajJ4RXSo+z
         IkHWlqhC6Qdr+cFi/5g1W3lP7ZKL8Dg19oVOZYCv1Y/jiUmghWJxl753kjPD9OxhfVo+
         fMzxKXkPPwyJvJIPXUUR4Wo/vJf+G8izky5NqyNNuRmpOSsIGuM/Vvvh7B3xZCHDej0g
         LWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785167307; x=1785772107;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2HmQTvTcT7QkqefKZGOjPiGMZ/ZgGZCcwnmf7IF3fIU=;
        b=rDL41rxFSqFRlhQ/IvY/e7wq0tbB0fVKKl/iJYgUnH+fouMhs2cJYDZ5Et/EA3HM2w
         IqbfvukakKtN0bbSutbp5ip0ZXoSaNQAix01M4uF7nU+1qA8Cv3kLfjHmPeoiRrE/IhF
         TetiPZbK4RHbb1UjARVQ64gKoekVg+7VColy7Le3qgtOx8JYvtiVOAAahUtvVjEP+W32
         bswZgYebC6bZFpJNFkyu2XCVyAcFKpeTIktAUiv37sgkQnKHetacXkqCjm7mw3vJcZ/l
         L8sWXzXbb+rsyW81uEeqCZzEla86lc+xXzJIfgQtRLQdGcvnG8aOhtDgcS/4mDOb8xED
         UJeg==
X-Forwarded-Encrypted: i=1; AHgh+RrDzx0s8012Nbatoo0k+00IOIGkx/oHczR1YnVbSL2QwMuaTAShR6Wwykub5SwHy7ivdG/uBbB6Ztc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaYMiP4hqceOg0rXpfg/pK2Q+mcu9ZEszUs939ThzQiVI1VWzX
	5Fp5QLFA6ti+LbKZcuC30+g8ZIwQiFk4WMUWL5ObGJFWFO462HsKwkXUEgUFikRuQLUWt6stHch
	EQJUItCnzvVqxD/kfGvA0MtRlChaZqxbs5gC8hUDdwJVXqCz95jCliO3YmTvueA==
X-Gm-Gg: AR+sD12AY4i1JZdNST+pSTu+eN7tyWARsNux6hIOsSE6unreziNSlfTTSyxKaM58LXu
	+fNkgnljezmRfNModTf7vbA5zs3ORlUUmKiTFaj7oX4hNcV/V3J5AbCtbL9ejpSKMzxtGEuIIYb
	cZq4hBtASTTtyRJqOXUN3MijygOcy+as8n59aLNxBQiBWlw6fdn7Of1c31rH/1UHTpqfUlj4T0F
	dKlwhOEmUGwOngjlHLt2xm7FYVK/pom05tlu+SXMXlyuStzlC42cr5Ch7m5xgzlNVezGaSQKNCt
	dViLOSEDngkyKNGMNawzHaD8OhzvSccH4B5Nvdhhq8w2UbPnfC8Nv7IKINPOMNZcTs9s16A2ZKj
	+GH3i/iUbF/UqJp6sWPrNA5doSbrhY2QeACg=
X-Received: by 2002:ac8:7fc2:0:b0:51e:49d7:771f with SMTP id d75a77b69052e-529a864d795mr93032641cf.57.1785167307586;
        Mon, 27 Jul 2026 08:48:27 -0700 (PDT)
X-Received: by 2002:ac8:7fc2:0:b0:51e:49d7:771f with SMTP id d75a77b69052e-529a864d795mr93032061cf.57.1785167307010;
        Mon, 27 Jul 2026 08:48:27 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a29884e7sm55881501cf.17.2026.07.27.08.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:48:25 -0700 (PDT)
Date: Mon, 27 Jul 2026 11:48:22 -0400
From: Brian Masney <bmasney@redhat.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	bjorn.andersson@oss.qualcomm.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, konrad.dybcio@oss.qualcomm.com,
	mukesh.savaliya@oss.qualcomm.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH] clk: Guard clk_round_rate() against error pointers
Message-ID: <amd9xsbj92urjUc_@redhat.com>
References: <20260723-fix_ptr_check_on_clk-v1-1-568a7ed87746@oss.qualcomm.com>
 <amIlYNjWeJQ9tcOB@redhat.com>
 <bbea2bd8-adf9-497d-a159-1871aaa9cce3@oss.qualcomm.com>
 <amOId3MHkryiFwC1@redhat.com>
 <amPY3TNEFwtlpzWw@venus>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amPY3TNEFwtlpzWw@venus>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 24, 2026 at 11:40:19PM +0200, Sebastian Reichel wrote:
> On Fri, Jul 24, 2026 at 11:44:55AM -0400, Brian Masney wrote:
> > On Thu, Jul 23, 2026 at 10:10:06PM +0530, Praveen Talari wrote:
> > > On 23-07-2026 19:59, Brian Masney wrote:
> > > > On Thu, Jul 23, 2026 at 11:40:47AM +0530, Praveen Talari wrote:
> > > > > clk_round_rate() only checks for a NULL clk pointer before
> > > > > dereferencing it, but callers such as dev_pm_opp_set_rate() can pass
> > > > > it an error pointer (e.g. ERR_PTR(-ENOENT) left behind by
> > > > > clk_get() when a device has no Linux clock and is instead managed by
> > > > > firmware via a genpd/OPP performance domain).
> > > > > 
> > > > > Dereferencing that error pointer to read clk->exclusive_count
> > > > > crashes with an unhandled kernel NULL pointer dereference, since
> > > > > ERR_PTR(-ENOENT) plus the field's offset lands on a small, unmapped
> > > > > address:
> > > > > 
> > > > >    Unable to handle kernel NULL pointer dereference at virtual
> > > > >    address 000000000000002e
> > > > >    ...
> > > > >    pc : clk_round_rate+0x3c/0x188
> > > > >    ...
> > > > >    Call trace:
> > > > >     clk_round_rate+0x3c/0x188 (P)
> > > > >     dev_pm_opp_set_rate+0x114/0x33c
> > > > > 
> > > > > Change the guard from "if (!clk)" to "if (IS_ERR_OR_NULL(clk))",
> > > > > matching the pattern already used by other clk consumer API
> > > > > functions such as clk_unprepare(), so an error pointer is rejected
> > > > > the same way a NULL pointer is.
> > > > > 
> > > > > Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> > > > > ---
> > > > >   drivers/clk/clk.c | 2 +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > > index 048adfa86a5d..8c1ad3d10284 100644
> > > > > --- a/drivers/clk/clk.c
> > > > > +++ b/drivers/clk/clk.c
> > > > > @@ -1780,7 +1780,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
> > > > >   	struct clk_rate_request req;
> > > > >   	int ret;
> > > > > -	if (!clk)
> > > > > +	if (IS_ERR_OR_NULL(clk))
> > > > Can you provide more details about the clk_get() call point that starts this
> > > > error? Specifically which driver this occurs in and the exact scenario that
> > > > triggers this.
> > > 
> > > On SA8255P platform there is no Linux
> > > clock for the SE, and the perf domain device's OPPs are populated entirely
> > > from firmware via devm_pm_opp_of_add_table() (through
> > > of_genpd_add_provider_simple()/onecell()), so the perf domain's OPP table
> > > has entries even though no clk_get() ever succeeds for it.
> > > 
> > > The clk_get(-ENOENT) case comes from _update_opp_table_clk() in
> > > drivers/opp/core.c:
> > > 
> > >     opp_table->clk = clk_get(dev, NULL);
> > >     ret = PTR_ERR_OR_ZERO(opp_table->clk);
> > >     ...
> > >     if (ret == -ENOENT) {
> > >         /* ... no clk provided ... */
> > >         opp_table->clk_count = 1;
> > >         return opp_table;   /* opp_table->clk left as ERR_PTR(-ENOENT) */
> > >     }
> > > 
> > > Because the perf domain device has no "clocks" property (its OPPs are
> > > supplied purely as performance states by firmware/genpd), clk_get()
> > > returns -ENOENT, and opp_table->clk is left holding that error pointer
> > > rather than being reset to NULL.
> > 
> > This looks to be a reasonable change. Thanks.
> > 
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> I suggest to instead change the OPP code, so that it calls
> clk_get_optional() instead of clk_get() and thus properly
> "document" that the clock is optional and use the NULL dummy
> clock (it's also shorter):
> 
> /*
>  * There are few platforms which don't want the OPP core to
>  * manage device's clock settings. In such cases neither the
>  * platform provides the clks explicitly to us, nor the DT
>  * contains a valid clk entry. The OPP nodes in DT may still
>  * contain "opp-hz" property though, which we need to parse and
>  * allow the platform to find an OPP based on freq later on.
>  *
>  * This is a simple solution to take care of such corner cases,
>  * i.e. make the clk_count 1, which lets us allocate space for
>  * frequency in opp->rates and also parse the entries in DT.
>  */
> opp_table->clk = clk_get_optional(dev, NULL);
> 
> ret = PTR_ERR_OR_ZERO(opp_table->clk);
> if (ret) {
>     dev_pm_opp_put_opp_table(opp_table);
>     dev_err_probe(dev, ret, "Couldn't find clock\n");
>     return ERR_PTR(ret);
> }
> 
> if (opp_table->clk)
>     opp_table->config_clks = _opp_config_clk_single;
> opp_table->clk_count = 1;
> return opp_table;

Yes, that makes sense. Thanks!

Brian

