Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1433195186-14867-2-git-send-email-dinguyen@opensource.altera.com>
References: <1433195186-14867-1-git-send-email-dinguyen@opensource.altera.com>
	<1433195186-14867-2-git-send-email-dinguyen@opensource.altera.com>
Date: Tue, 2 Jun 2015 09:16:59 +0200
Message-ID: <CAMuHMdXeB2Qu83sKbjG_WuT1MaHcrFb-h3TT3wrMHGaG9OAa8w@mail.gmail.com>
Subject: Re: [RFC/PATCHv1 1/2] clk: of: helper for filling parent clock array
 and return num of parents
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>,
	Dinh Nguyen <dinh.linux@gmail.com>, linux-clk@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jun 1, 2015 at 11:46 PM,  <dinguyen@opensource.altera.com> wrote:
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3060,6 +3060,26 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
>  }
>  EXPORT_SYMBOL_GPL(of_clk_get_parent_name);
>
> +/*
> + * of_clk_parent_fill(): Helper clock function that will fill the parent
> + * clock's array and return the number of parents it found.
> + * @np: Device node pointer associated with clock provider
> + * @parents: pointer to char array that hold the parent's name
> + * @size: size of the parents array
> + *
> + * Returns number of parents for the clock node.
> + */
> +int of_clk_parent_fill(struct device_node *np, const char **parents, int size)

I'd say "unsigned int size", but of_clk_get_parent_name(),
of_parse_phandle_with_args(), and of_property_read_string_index() also take
"int" :-(

> +{
> +       int i = 0;

If "size" becomes "unsigned int", "i" should be "unsigned int", too.

> +
> +       while (i < size && (parents[i] = of_clk_get_parent_name(np, i)) != NULL)
> +               i++;
> +
> +       return i;

Return type "int" is OK, though...

> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
