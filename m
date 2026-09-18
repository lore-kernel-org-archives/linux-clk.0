Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6695C3A5433
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 22:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770076; cv=none; b=fXZlj7cXw6GX0WjwcUCQZmvD3h2A3/mLxb2Pyrtf8Ac4V/fz/aAmkipsmdCrG8BJsuEg6KGLwEdLd5r9HEkub3l9ms6NSuR8CY18nyIbtX1z9Vc8uSkNU/e3NeH+k4SKaawY1bADCFRQ//ugPrzmI+3l2r5VsTdMr8LtzlUS+bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770076; c=relaxed/simple;
	bh=+FwJtlfrM0QgaoS3zhsMAFRd0dW54ltAMUamg6i/wMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au/xRUhPpTf8CaKdFHnQWCCNdKHt+7D312Q9SnOxCsWUXm2OB5Ih/S589Z3iJUN64aIomE70dHz80mXR410y4dq/02T7mzWdA4itwQrCXVPobO5/+jD3DdX/9VTKYCvYdB1kIhpAoujEasUMyJv/nEO0YZiMXw6wG/QzvQzgFY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvAe87js; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+389A5F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvAe87js";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+389A5F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z7dezM5jMkC2kVacafvsV0OwTH65W5JtT/fFjd8EacQ=;
	b=UvAe87jsIJP1Ozh20NDvwE42lX0OoZ3HvOXyJSjVj+rhxDKn0eUxF7NvuOmFczbJkdwOIK
	SAuKGpNCavrKFksFoza3ewQBMeYLjeSi8pDlDuVCid0TaDfOQWDdfGiobtB40zy3PxaieI
	mK1sspzKfnL/2WS6Y9KIfSfN5pWvqE4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-TNew0FVBPMiZsVLAOcOl7w-1; Fri, 18 Sep 2026 18:21:11 -0400
X-MC-Unique: TNew0FVBPMiZsVLAOcOl7w-1
X-Mimecast-MFC-AGG-ID: TNew0FVBPMiZsVLAOcOl7w_1789770071
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso265789085a.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770071; x=1790374871; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z7dezM5jMkC2kVacafvsV0OwTH65W5JtT/fFjd8EacQ=;
        b=V+389A5FUoTXwXXkSzzwSQsnFjfvqR7Iy3aZ9b/YsDc0lwvFQ4LbAs3jtyfYYQwKZD
         VJG4zw7cPQFhoa7H1Cf/NhSdZfd3J9lEIbmDhS/RrJon2nEFnqUi+qshF775woaZuzKT
         0vlttLAkDW200B3J9fzPe0G+AuuZLsuoCIOGIZnChG/Dr1B2rZmKz8cg+gUJghzdoh4L
         wQLh7ZbImLP3pk4KW/E9HSKAb2ccwtKLmcOR7zGoSjvfZkw7EJcVf6sk08iHIvVrKpHD
         OcgFJR9ac5fsC6ExJuz3erJBZzRPPGXyi9dHpAdIUogWhBPHWfhISQSGNnPfjk0C0c18
         3RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770071; x=1790374871;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7dezM5jMkC2kVacafvsV0OwTH65W5JtT/fFjd8EacQ=;
        b=hcqO2Hv/6UXZ6ShB1vTpvKoGQXqL13FRXYf/yxgJ5qS6nNN5rdeYkct4+rUe6r4HhB
         bnChwbn4cCetj55jEzavGIpWGW3OyIphIyCNQur0PV/EDC+uh+rvODceGLGqBLDWv3i1
         EPPtvfN+G4sW8Q5s8GiSj9xbTgp2uZqnRfNHhvW8w7qNxJ6NvVmd9X2XP9pyYGK67ASA
         QEzjszqj1yVAb0qSLz4DQKJvDiGfOYeFA3rbeCJOZXuOLqrfOoHUWuE9HIHX/aBNubSe
         GmE+uUU5ka9vUQAC26naAm3WaRW1gKDidsKezP9WfYoYlvj1erEYKzMBv3guDK/67yN0
         Am5w==
X-Forwarded-Encrypted: i=1; AKwUvBycyXnp/waBbX5csZ6116E21VHq+Tjh/UqtwATYCsUDvw+Of3iTz698TjyENu7t6wSqdmPG0oLG/lk=@vger.kernel.org
X-Gm-Message-State: AFuF++mrq4Cd/gF8LUoPaWBfUgMQO9dsX/jql7ss/A+G9UBRfDwfSK6V
	xyDRnJ+RkyedsxtbN0grluEhjCsMADGKSFskN1+VW9uVNkpgZ4YNgereWBz3IxusLOVw5IVamDt
	2f97gF+bFi5ipDVTJIXt0StMFTkwMN2EGH/VvI/0dTgtwnPw7otNBeDVFSZjw9dbqDFKGNA==
X-Gm-Gg: AYBFou3vm5YumJ5KzhujIksvWL5RVfIfG+QTU3J9Rfk6HFkX7OnJLWz3S+3ht5g3MyL
	LAnCfvtOeQCbwh0rIbbB3p3KnZEoUmaG2E83AX59EC3qWP8pMMaQmqtnhcIfnz53vZ7xuafYTpH
	onBK0yMQOLt0RB0aqDf/pceEvggdEnWvmRKhLTsHXuzbd7imrJGn01Aq/wtN21vBfJMOjZ8/eHP
	zB9kEvU2GkHHgPF7egottnwr6Gvi3VopdE+GiYJsnGKCT0NWdShDqKnlzDeCr06xTwNYF2+OUG9
	TyampUHiXq6LsYhtg9Lw9kfLuEEgIxM/vxwzFfxeFHMKZw0DD6O2vsha+8CGJvMpiHPl7nM=
X-Received: by 2002:a05:620a:4505:b0:93b:d7a4:9d51 with SMTP id af79cd13be357-93bdbc7bb10mr618657985a.36.1789770070971;
        Fri, 18 Sep 2026 15:21:10 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93b:d7a4:9d51 with SMTP id af79cd13be357-93bdbc7bb10mr618655485a.36.1789770070577;
        Fri, 18 Sep 2026 15:21:10 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedb6759bsm49189185a.43.2026.09.18.15.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:21:08 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:21:06 -0400
From: Brian Masney <bmasney@redhat.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: biju.das.jz@bp.renesas.com, sboyd@kernel.org, bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] clk: versaclock7: propagate all xin lookup failures
Message-ID: <aq25UlM87_UIatKW@redhat.com>
References: <20260911060918.94343-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911060918.94343-1-bolin.liu@seu.edu.cn>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Slavin,

On Fri, Sep 11, 2026 at 02:09:18PM +0800, Slavin Liu wrote:
> The xin clock is used to obtain the APLL reference rate. Handle all
> lookup errors, not only probe deferral, before clk_get_rate() can see
> an error pointer.
> 
> Detected by static analysis and reviewed with AI-assisted source auditing.
> 
> Fixes: 48c5e98fedd9 ("clk: Renesas versaclock7 ccf device driver")
> Assisted-by: LLM
> Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
> ---
>  drivers/clk/clk-versaclock7.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
> index 1340d2f512be..5f32d3fb807a 100644
> --- a/drivers/clk/clk-versaclock7.c
> +++ b/drivers/clk/clk-versaclock7.c
> @@ -1117,8 +1117,8 @@ static int vc7_probe(struct i2c_client *client)
>  	vc7->chip_info = i2c_get_match_data(client);
>  
>  	vc7->pin_xin = devm_clk_get(&client->dev, "xin");
> -	if (PTR_ERR(vc7->pin_xin) == -EPROBE_DEFER) {
> -		return dev_err_probe(&client->dev, -EPROBE_DEFER,
> +	if (IS_ERR(vc7->pin_xin)) {
> +		return dev_err_probe(&client->dev, PTR_ERR(vc7->pin_xin),
>  				     "xin not specified\n");

Could you clarify the error message as well? Perhaps 'devm_clk_get failed for
xin' ?

You can drop the PATCH RFC on the next version.

Brian

